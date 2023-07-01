//
//  VistaPruebas2.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 25/06/23.
//

import SwiftUI

struct VistaPruebas2: View {
    @State private var isCheckboxChecked = false
    
    var body: some View {
        VStack {
            Text("Contenido de la vista principal")
            
            SubView(isCheckboxChecked: $isCheckboxChecked)
            MonumentCelView(isCheckboxChecked: $isCheckboxChecked, monumentImage: "https://www.wagnerproducciones.com/travelmeit/monumentos/APP%20IMG__PUENTE%20DE%20LOS%20SUSPIROS%202.jpg", distance: 2.34, title: "BarrancoPrueba")
            
            Text("Checkbox seleccionado: \(isCheckboxChecked.description)")
        }
    }
}

struct SubView: View {
    @Binding var isCheckboxChecked: Bool
    
    var body: some View {
        HStack {
            Text("Texto en la subvista")
            
            Checkbox(isChecked: $isCheckboxChecked)
        }
    }
}


struct VistaPruebas2_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas2()
    }
}
