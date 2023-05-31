//
//  VistaPruebas.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI

struct VistaPruebas: View {
    @State private var selectedImageIndex = 0
        
        let images = ["globe", "globe.fill", "globe", "globe", "globe"]
        
        var body: some View {
            VStack {
                TabView(selection: $selectedImageIndex) {
                    ForEach(0..<images.count) { index in
                        Image(images[index])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tag(index)
                            .onTapGesture {
                                selectedImageIndex = index
                            }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                
                HStack {
                    ForEach(0..<images.count) { index in
                        Circle()
                            .fill(index == selectedImageIndex ? Color.blue : Color.gray)
                            .frame(width: 10, height: 10)
                            .padding(.horizontal, 4)
                    }
                }
                .padding(.top, 8)
            }
            .padding()
        }
}
    

struct VistaPruebas_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas()
    }
}
