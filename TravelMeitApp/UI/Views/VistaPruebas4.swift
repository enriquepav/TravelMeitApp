//
//  VistaPruebas4.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 26/06/23.
//

import SwiftUI

struct VistaPruebas4: View {
    @State private var isChecked = false

    var body: some View {
        VStack {
            if isChecked {
                Text("Checkbox seleccionado")
                    .font(.headline)
            } else {
                Text("Checkbox vacío")
                    .font(.headline)
            }

            Button(action: {
                isChecked = true

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isChecked = false
                }
            }) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .padding()
    }
}

struct VistaPruebas4_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas4()
    }
}
