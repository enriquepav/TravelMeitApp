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
                    .placeholder(Image("loadingView")) // Imagen de relleno mientras se carga
                    .indicator(.activity) // Indicador de actividad mientras se carga
                    .aspectRatio(contentMode: .fit)
                    .clipped()
//                    .border(Color.red, width: 2)
                
                VStack(alignment: .leading) {
                    HStack {
                        Spacer(minLength: 5)
                        Text(splitTextIntoTwoLines(title))
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
        .frame(width: 140, height: 140)

            
    }
    
    func splitTextIntoTwoLines(_ sentence: String) -> String {
        let words = sentence.split(separator: " ")
        let wordsQuan = words.count
        var line1 = ""
        var line2 = ""
        var diferences: [Int] = []

        for i in 0...(wordsQuan-1) {
            line1 = words.prefix(i).joined(separator: " ")
            line2 = words.suffix(from: i).joined(separator: " ")
            let diference = abs(line1.count - line2.count)
            diferences.append(diference)
        }
        if let minValue = diferences.min(), let index = diferences.firstIndex(of: minValue) {
            line1 = words.prefix(index).joined(separator: " ")
            line2 = words.suffix(from: index).joined(separator: " ")

            return "\(line1)\n\(line2)"
        } else {
            return "Error en obtener el titulo"
        }
    }
}

struct MonumentCelMapView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentCelMapView(monumentImage: "https://www.wagnerproducciones.com/travelmeit/monumentos_tallinn/raekoja%20plats.jpg", title: "Plaza de barranco")
    }
}
