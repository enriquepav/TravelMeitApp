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
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            removeItem(item)
                                        }
                                    }
                                }
                            ))
                        }
                        .frame(width: 100, height: 100)
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 2)))
                    }
                }
            }
        }
        .padding()
    }
    
    private func itemIsSelected(_ item: Int) -> Bool {
        selectedItems.contains(where: { $0 == item })
    }
    
    private func removeItem(_ item: Int) {
        withAnimation {
            items.removeAll(where: { $0 == item })
        }
    }
}



struct VistaPruebas_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas()
    }
}
