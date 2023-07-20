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
                    .placeholder(Image("loadingView")) // Imagen de relleno mientras se carga
                    .indicator(.activity) // Indicador de actividad mientras se carga
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                VStack {
                    Text(splitTextIntoTwoLines(title))
                        .foregroundColor(.white)
                        .font(.custom("quicksand", size: 12).bold())
                        .padding(8)
                        .background(RoundedCorners(color: .principalColor, tl: 0, tr: 00, bl: 30, br:30))
                    Spacer()
                    HStack {
                        Label{
                            Text(String(format: "%.2f" + " " + typeLong, distance))
                                .foregroundColor(.white)
                                .font(.custom("quicksand", size: 10).bold())
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
}

func splitTextIntoTwoLines(_ sentence: String) -> String {
    let words = sentence.split(separator: " ")
    let wordsQuan = words.count
    var line1 = ""
    var line2 = ""
    var diferences: [Int] = []
    
    if sentence.count < 20 { // Si la sentencia tiene menos de 20 caracteres, no es necesario dividirla
            return sentence
    } else {
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


struct MonumentCelView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MonumentCelView(monumentImage: "https://www.wagnerproducciones.com/travelmeit/monumentos_tallinn/raekoja%20plats.jpg", distance: 0.20444, title: "Barranco train station")
    }
}
