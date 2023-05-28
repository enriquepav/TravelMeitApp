//
//  VistaPruebas.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI

struct VistaPruebas: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("barrancoframe")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                
                Text("Título de la imagen")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.5))
            }
        }
    }
}

struct DetailView: View {
    let selectedOption: String
    
    var body: some View {
        Text("Opción seleccionada: \(selectedOption)")
    }
}
    

struct VistaPruebas_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas()
    }
}
