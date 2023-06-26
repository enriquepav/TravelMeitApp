//
//  VistaPruebas3.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 26/06/23.
//

import SwiftUI

struct VistaPruebas3: View {
    @State private var isCheckboxChecked = false
    
    var body: some View {
        ZStack {
            MonumentCelView(isCheckboxChecked: $isCheckboxChecked, monumentImage: "https://www.wagnerproducciones.com/travelmeit/monumentos/APP%20IMG__PUENTE%20DE%20LOS%20SUSPIROS%202.jpg", distance: 2.34, title: "BarrancoPrueba")
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Checkbox(isChecked: $isCheckboxChecked)
                }
            }
        }.frame(width: 150, height: 280)
    }
}

struct VistaPruebas3_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas3()
    }
}
