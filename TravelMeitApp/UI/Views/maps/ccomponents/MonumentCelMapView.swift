//
//  MonumentCelMapView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 26/06/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MonumentCelMapView: View {
    @State var monumentImage: String
    @State var title: String
    var typeLong: String = "km."
    
    
    var body: some View {
        VStack {
            ZStack {
                WebImage(url: URL(string: monumentImage))
                    .resizable()
                    .placeholder(Image(systemName: "photo")) // Imagen de relleno mientras se carga
                    .indicator(.activity) // Indicador de actividad mientras se carga
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .scaleEffect(1.3)
//                    .border(Color.red, width: 2)
                
                VStack(alignment: .leading) {
                    HStack {
                        Spacer(minLength: 5)
                        Text(partirOracionEnDos(oracion:title))
                            .foregroundColor(.white)
                            .font(.custom("MTS", size: 7))
                            .bold()
                            .padding(6)
                            .background(Color.principalColor)
                            .cornerRadius(10)
                        Spacer()
        
                    }
                    Spacer()
                }
            }
        }
        .frame(width: 100, height: 100)
    }
    
    func partirOracionEnDos(oracion: String) -> String {
        let palabras = oracion.split(separator: " ")
        let mitad = palabras.count / 2 + 1
        
        let primeraMitad = palabras[0..<mitad].joined(separator: " ")
        let segundaMitad = palabras[mitad..<palabras.count].joined(separator: " ")
        
        return "\(primeraMitad)\n\(segundaMitad)"
    }
}

struct MonumentCelMapView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentCelMapView(monumentImage: "https://www.wagnerproducciones.com/travelmeit/monumentos/MUSEO%20PEDRO%20DE%20OSMA%201.jpg", title: "Plaza de barranco")
    }
}
