//
//  MonumentsListView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 25/05/23.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct MonumentsListView: View {
    
    @State private var selectedOption: Int = 2 // Estado de selección
    let distanceSelected: [Float] = [3.00, 10.00, 50.00] // Cambiar distancias
    let options = ["ic_3km", "ic_10km", "ic_50km"]
    let optionSelected = ["ic_3kmSelected", "ic_10kmSelected", "ic_50kmSelected"]
    @ObservedObject var viewModel = MonumentsListViewModel.shared
    @State private var isCheckboxChecked = false
    @State private var isAscending = true
    @State private var finalList: [MonumentData] = []

    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                VStack{
                    ProgressView()
                        .scaleEffect(1.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .principalColor))  // Show the loader when isLoading is true
                }
            } else {
                VStack {
                    Spacer(minLength: 40)
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)
                    ], spacing: 40) {
                        ForEach(finalList, id: \.monument) { item in
                            ZStack {
                                NavigationLink(destination: MonumentDetailView(monumentData: item)){
                                    MonumentCelView(monumentImage:item.image, distance: item.distance, title: item.monument)
                                }
                                VStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                            finalList.removeAll(where: { $0 == item })
                                            viewModel.monumentsData = finalList
                                        }) {
                                            Image("buttonDelete")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                        }
                                    }
                                }
                            }
                            .frame(width: 150, height: 280)
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: 2)))
                        }
                    }.padding()
                }
            }
        }.padding(.top, -20)
            .toolbar {
                ToolbarItemGroup() {
                    HStack {
                        Image("logoTravelmeit")
                            .resizable()
                            .frame(width: 150, height: 40)
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 0) {
                                ForEach(0..<options.count, id: \.self) { index in
                                    Button(action: {
                                        self.finalList = viewModel.monumentsData
                                        FilterManager.sharedInstance.distanceSelected = distanceSelected[index]
                                        selectedOption = index
                                        self.finalList = self.finalList.filter { item in
                                            return item.distance < FilterManager.sharedInstance.distanceSelected
                                        }
                                        self.finalList.sort{
                                            $0.distance < $1.distance
                                        }
                                        // Actualizar el estado de selección al hacer clic en la opción
                                    }) {
                                        if (selectedOption == index ){
                                            Image(optionSelected[index])
                                                .resizable()
                                                .frame(width: 32, height: 32)
                                        } else {
                                            Image(options[index])
                                                .resizable()
                                                .frame(width: 32, height: 32)
                                        }
                                    }
                                }
                            }
                        }
                        Button(action: {
                            isAscending.toggle()
                            self.finalList.sort{
                                $0.rating < $1.rating
                            }
                        }) {
                            Image("buttonOrder")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 38, height: 38)
                        }
                    }
                }
            }.navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                if(viewModel.isFirst){
                    viewModel.calculateDistance()
                    viewModel.filterByDistanceSelected()
                }
                self.finalList = viewModel.monumentsData
            }.accentColor(Color.principalColor)
    }
}


struct LoaderView: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}

struct MonumentsListView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentsListView()
    }
}
