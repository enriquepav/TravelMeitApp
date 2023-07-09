//
//  VistaPruebas.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI

struct VistaPruebas: View {
    let texto = "Plaza de barranco"

        var body: some View {
            VStack {
                Text(limitarCaracteresPorLinea(texto: texto, limiteCaracteresPorLinea: 5))
                    .lineLimit(3)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.yellow)
                    .foregroundColor(.black)
                    .font(.body)
                
                Spacer()
            }
            .padding()
        }
        
        func limitarCaracteresPorLinea(texto: String, limiteCaracteresPorLinea: Int) -> String {
            let palabras = texto.split(separator: " ")
            let textoFormateado = palabras
                .map { String($0.prefix(limiteCaracteresPorLinea)) }
                .joined(separator: " ")
            return textoFormateado
        }
}



struct VistaPruebas_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas()
    }
}
