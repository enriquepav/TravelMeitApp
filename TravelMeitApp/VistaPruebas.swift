//
//  VistaPruebas.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI

struct VistaPruebas: View {
    
    let items = 1...10
        
        var body: some View {
            ScrollView {
                VStack {
                    Text("Cabecera")
                        .font(.headline)
                        .padding()
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]) {
                        ForEach(items, id: \.self) { item in
                            Text("Item \(item)")
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                        }
                    }
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
