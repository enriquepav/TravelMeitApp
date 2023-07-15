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
                            .font(.custom("quicksand", size: 7))
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
    
    func partirOracionEnDos (oracion: String) -> String {
        let longitud = oracion.count
           let mitad = longitud / 2
           
           let indiceEspacio = oracion.index(oracion.startIndex, offsetBy: mitad)
           
           let primeraMitad = oracion[..<indiceEspacio]
           let segundaMitad = oracion[indiceEspacio...]
           
           return "\(primeraMitad)\n\(segundaMitad)"
    }
}

struct MonumentCelMapView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentCelMapView(monumentImage: "https://www.wagnerproducciones.com/travelmeit/monumentos_tallinn/raekoja%20plats.jpg", title: "Plaza de barranco")
    }
}
