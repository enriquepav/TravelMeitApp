//
//  MonumentCelView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 25/05/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MonumentCelView: View {
    
    @State var monumentImage: String
    @State var distance: Float
    @State var title: String
    var typeLong: String = "km."
    
    
    var body: some View {
        VStack {
            ZStack {
              WebImage(url: URL(string: monumentImage))
                    .resizable()
                    .placeholder(Image(systemName: "photo")) // Imagen de relleno mientras se carga
                    .indicator(.activity) // Indicador de actividad mientras se carga
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                VStack {
                    Text(partirOracionEnDos(oracion:title))
                        .foregroundColor(.white)
                        .font(.custom("quicksand", size: 18))
                        .bold()
                        .padding(10)
                        .background(RoundedCorners(color: .principalColor, tl: 0, tr: 00, bl: 30, br:30))
                    Spacer()
                    HStack {
                        Label{
                            Text(String(format: "%.2f" + " " + typeLong, distance))
                                .foregroundColor(.white)
                                .font(.system(size: 10, weight: .bold))
                                .padding(3)
                        } icon: {
                            Image("ic_location")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 10)
                                .padding(5)
                        }
                        .background(
                            RoundedCorners(color: .thirdColor, tl: 3, tr: 3, bl: 3, br:3))
                        .padding(10)
                        Spacer().frame(width: 10)
                    }
                }
            }
        }
        .frame(width: 90, height: 10)
    }
    func partirOracionEnDos (oracion: String) -> String {
        let longitud = oracion.count
        let mitad = longitud / 2
           
        let espacioAnterior = oracion[..<oracion.index(oracion.startIndex, offsetBy: mitad)].lastIndex(of: " ") ?? oracion[..<oracion.index(oracion.startIndex, offsetBy: mitad)].lastIndex(of: "-")
        let espacioSiguiente = oracion[oracion.index(oracion.startIndex, offsetBy: mitad)...].firstIndex(of: " ") ?? oracion[oracion.index(oracion.startIndex, offsetBy: mitad)...].firstIndex(of: "-")
        
        let indiceEspacio: String.Index
        if let espacioAnterior = espacioAnterior {
            if let espacioSiguiente = espacioSiguiente {
                indiceEspacio = espacioAnterior > espacioSiguiente ? espacioAnterior : espacioSiguiente
            } else {
                indiceEspacio = espacioAnterior
            }
        } else {
            if let espacioSiguiente = espacioSiguiente {
                indiceEspacio = espacioSiguiente
            } else {
                indiceEspacio = oracion.index(oracion.startIndex, offsetBy: mitad)
            }
        }
        
        let primeraMitad = oracion[..<indiceEspacio]
        let segundaMitad = oracion[indiceEspacio...]
        
        return "\(primeraMitad)\n\(segundaMitad)"
    }
}
    




struct MonumentCelView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentCelView(monumentImage: "https://www.wagnerproducciones.com/travelmeit/monumentos_tallinn/raekoja%20plats.jpg", distance: 0.20444, title: "Barranco Train Station")
    }
}
