//
//  MonumentsListView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 25/05/23.
//

import SwiftUI

struct MonumentsListView: View {
    
    let items: [Float] = [1.50, 0.15, 0.89, 2.35, 1.69, 3.45]// Reemplaza "YourDataType" con el tipo de dato que utilices en tu grid
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Cabecera")
                    .font(.headline)
                    .padding()
                Spacer(minLength: 150)
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 20),
                    GridItem(.flexible(), spacing: 20)
                ], spacing: 300) {
                    ForEach(items, id: \.self) { item in
                        MonumentCelView(distance: item)
                    }
                }
                .padding()
            }

        }
    }
}

struct MonumentsListView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentsListView()
    }
}
