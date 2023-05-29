//
//  MonumentsListView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 25/05/23.
//

import SwiftUI

struct MonumentsListView: View {
    
    let items: [Float] = [1.50, 0.15, 0.89, 2.35, 1.69, 3.45]// Reemplaza "YourDataType" con el tipo de dato que utilices en tu grid
    
    @ObservedObject var viewModel = MonumentsListViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Spacer(minLength: 150)
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)
                    ], spacing: 300) {
                        ForEach(viewModel.monumentsData, id: \.id) { item in
                            NavigationLink(destination: MonumentDetailView(name: item.monument, distance: 1.50)) {
                                MonumentCelView(distance: 1.50, title: item.monument)
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
                        Image("logoTravelmeit")
                            .resizable()
                            .frame(width: 150, height: 40)
                        Spacer(minLength: 50)
                        Image("ic_3km")
                            .resizable()
                            .frame(width: 32, height: 32)
                        Image("ic_10km")
                            .resizable()
                            .frame(width: 32, height: 32)
                        Image("ic_50km")
                            .resizable()
                            .frame(width: 32, height: 32)
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
