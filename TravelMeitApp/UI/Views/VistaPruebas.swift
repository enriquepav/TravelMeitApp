//
//  VistaPruebas.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI
import AVFoundation

struct VistaPruebas: View {
    
    struct Option: Identifiable {
        let id = UUID()
        let icon: String
        var isSelected = false
    }
    
    @State private var options = [
        Option(icon: "heart"),
        Option(icon: "star"),
        Option(icon: "circle")
    ]
    
    @State private var selectedOptionIDs: Set<UUID> = []
    var body: some View {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(50))], spacing: 10) {
                    ForEach(options) { option in
                        Button(action: {
                            toggleSelection(option)
                        }) {
                            Image(systemName: option.isSelected ? "\(option.icon).fill" : option.icon)
                                .foregroundColor(option.isSelected ? .white : .black)
                                .padding()
                                .background(option.isSelected ? Color.blue : Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
        }

        func toggleSelection(_ option: Option) {
            if selectedOptionIDs.contains(option.id) {
                    selectedOptionIDs.remove(option.id)
                } else {
                    selectedOptionIDs.insert(option.id)
                }
                options = options.map { var updatedOption = $0; updatedOption.isSelected = selectedOptionIDs.contains(updatedOption.id); return updatedOption }
        }
   
    
}
struct VistaPruebas_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas()
    }
}
