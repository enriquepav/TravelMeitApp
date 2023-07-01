//
//  CachedAsyncImage.swift
//  TravelMeitApp
//
//  Created by Katherine Caillahua Castillo on 15/06/23.
//

import Foundation
import SwiftUI

struct CachedAsyncImage: View {
    private let url: URL
    private let placeholder: Image

    init(url: URL, placeholder: Image) {
        self.url = url
        self.placeholder = placeholder
    }

    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
        .onAppear {
            downloadImageIfNeeded()
        }
    }

    private func downloadImageIfNeeded() {
        guard let imageData = ImageCache.shared.image(for: url) else {
            downloadImage()
            return
        }

        ImageCache.shared.storeImage(imageData, for: url)
    }

    private func downloadImage() {

        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                return
            }

            DispatchQueue.main.async {
                ImageCache.shared.storeImage(image, for: url)
            }
        }.resume()
    }
}

class ImageCache {
    static let shared = ImageCache()

    private let urlCache = URLCache.shared

    func storeImage(_ image: UIImage, for url: URL) {
        let request = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!, data: image.pngData()!)
        urlCache.storeCachedResponse(cachedResponse, for: request)
    }

    func image(for url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let cachedResponse = urlCache.cachedResponse(for: request) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
}
