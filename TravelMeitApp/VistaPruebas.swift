//
//  VistaPruebas.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI

struct VistaPruebas: View {
    
    @State private var selectedOption: String?
        let options = ["Opción 1", "Opción 2", "Opción 3"]
        
        var body: some View {
            NavigationView {
                VStack {
                    NavigationLink(destination: DetailView(selectedOption: selectedOption ?? "")) {
                        Text("Ir al detalle")
                    }
                    .disabled(selectedOption == nil) // Deshabilitar el enlace si no se ha seleccionado ninguna opción
                    
                    Picker("Selecciona una opción", selection: $selectedOption) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(.wheel)
                    .padding()
                }
                .navigationBarTitle("Picker con NavigationLink")
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
