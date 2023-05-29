//
//  VistaPruebas.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI

struct VistaPruebas: View {

    var body: some View {
            NavigationView {
                VStack {
                    Text("Contenido de la vista")
                }
                .navigationBarTitle("Vista principal", displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {
                        // Acción del botón
                    }) {
                        Image(systemName: "plus")
                    }
                )
            }
        }
}
    

struct VistaPruebas_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas()
    }
}
