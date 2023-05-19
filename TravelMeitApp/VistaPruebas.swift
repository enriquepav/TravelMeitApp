//
//  VistaPruebas.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI

struct VistaPruebas: View {
    
    @State private var selectedOption: Int = 0 // Estado de selección
        
        let options = ["Opción 1", "Opción 2", "Opción 3"]
    
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(0..<options.count, id: \.self) { index in
                        Button(action: {
                            selectedOption = index // Actualizar el estado de selección al hacer clic en la opción
                        }) {
                            Text(options[index])
                                .font(.title)
                                .padding()
                                .background(selectedOption == index ? Color.blue.opacity(0.5) : Color.clear) // Marcar la opción seleccionada
                                .cornerRadius(10)
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
