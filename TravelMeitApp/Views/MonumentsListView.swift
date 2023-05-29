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
        NavigationView {
            ScrollView {
                VStack {
                    Spacer(minLength: 150)
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)
                    ], spacing: 300) {
                        ForEach(items, id: \.self) { item in
                            NavigationLink(destination: MonumentDetailView()) {
                                MonumentCelView(distance: item)
                            }
//                            .navigationBarItems(trailing:
//                                                    Button(action: {
//                                                        // Acción del botón
//                                                    }) {
//                                                        Image(systemName: "ellipsis")
//                                                            .rotationEffect(Angle(degrees: 90))
//                                                    }
//                                                )
                           
                        }
                    }
                    .padding()
                }
            }.toolbar {
                ToolbarItemGroup() {
                    HStack(alignment: .center) {
                        Image(systemName: "trash")
                            .frame(width: 32, height: 32)
                        Image("logoTravelmeit")
                            .resizable()
                            .frame(width: 150, height: 40)
                        Spacer(minLength: 50)
                        Image(systemName: "trash")
                            .frame(width: 32, height: 32)
                            .background(Color.blue)
                            .mask(Circle())
                        Image(systemName: "trash")
                            .frame(width: 32, height: 32)
                            .background(Color.blue)
                            .mask(Circle())
                        Image(systemName: "trash")
                            .frame(width: 32, height: 32)
                            .background(Color.blue)
                            .mask(Circle())
                    }
                }
                
            }
        }
    }
}

struct MonumentsListView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentsListView()
    }
}
