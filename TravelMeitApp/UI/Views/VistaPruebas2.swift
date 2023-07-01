//
//  VistaPruebas2.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 25/06/23.
//

import SwiftUI
import SDWebImageSwiftUI


struct VistaPruebas2: View {
    var imageUrl: String = "https://www.wagnerproducciones.com/travelmeit/monumentos/PARROQUIA%STA%CRUZ%1.jpg"

    var body: some View {
        VStack {
            WebImage(url: URL(string: imageUrl))
                .resizable()
                .placeholder(Image(systemName: "photo")) // Imagen de relleno mientras se carga
                .indicator(.activity) // Indicador de actividad mientras se carga
                .scaledToFit()
                .frame(width: 300, height: 300)
        }
    }
}


struct VistaPruebas2_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas2()
    }
}
