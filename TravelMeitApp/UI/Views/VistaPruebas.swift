//
//  VistaPruebas.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI

struct VistaPruebas: View {
    @State private var items = Array(1...10)
    @State private var selectedItems: [Int] = []

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(items, id: \.self) { item in
                    if !itemIsSelected(item) {
                        VStack {
                            Text("\(item)")
                            Checkbox(isChecked: Binding(
                                get: {
                                    itemIsSelected(item)
                                },
                                set: { value in
                                    if value {
                                        selectedItems.append(item)
                                    } else {
                                        if let index = selectedItems.firstIndex(of: item) {
                                            selectedItems.remove(at: index)
                                        }
                                    }
                                }
                            ))
                        }
                        .frame(width: 100, height: 100)
                    }
                }
            }
        }
        .padding()
    }
    
    private func itemIsSelected(_ item: Int) -> Bool {
        selectedItems.contains(where: { $0 == item })
    }
}

struct Checkbox: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 24, height: 24)
        }
    }
}


struct VistaPruebas_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas()
    }
}
