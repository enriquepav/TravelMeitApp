//
//  CheckBox.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 26/06/23.
//

import SwiftUI

struct Checkbox: View {
   
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(isChecked ? "checkBoxTrue" : "checkBoxFalse")
                .resizable()
                .frame(width: 24, height: 24)
        }
    }
    
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        Checkbox(isChecked:Binding.constant(true))
    }
}
