//
//  VistaPruebas.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI
import AVFoundation

struct VistaPruebas: View {
    var body: some View {
            Image(uiImage: loadImageFromURL(urlString: "https://drive.google.com/uc?id=1wF7AeMJ8LcqnrFNHK_Xxx-ES92ao6h4l"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
        
        func loadImageFromURL(urlString: String) -> UIImage {
            guard let url = URL(string: urlString) else {
                // Manejo de error si la URL no es válida
                return UIImage()
            }
            
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    // Manejo de error si los datos no pueden ser convertidos en una imagen
                    return UIImage()
                }
                
                return image
            } catch {
                // Manejo de error si no se puede cargar la imagen desde la URL
                return UIImage()
            }
        }
}
struct VistaPruebas_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas()
    }
}
