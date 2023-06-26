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
    
    
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                VStack{
                    ProgressView()
                        .scaleEffect(1.0, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .principalColor))  // Show the loader when isLoading is true
                }
            }else{
                VStack {
                    Spacer(minLength: 150)
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)
                    ], spacing: 300) {
                        ForEach(viewModel.monumentsData, id: \.monument) { item in
                            NavigationLink(destination: MonumentDetailView(monumentData: item)) {
                                MonumentCelView(isCheckboxChecked: $isCheckboxChecked, monumentImage:item.image, distance: item.distance, title: item.monument)
                            }
                        }
                    }
                    .padding()
                }
            }
        }.toolbar {
            ToolbarItemGroup() {
                HStack {
                    Image("logoTravelmeit")
                        .resizable()
                        .frame(width: 150, height: 40)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 0) {
                            ForEach(0..<options.count, id: \.self) { index in
                                Button(action: {
                                    FilterManager.sharedInstance.distanceSelected = distanceSelected[index]
                                    selectedOption = index
                                    viewModel.filterByDistanceSelected()
                                    // Actualizar el estado de selección al hacer clic en la opción
                                }) {
                                    if (selectedOption == index ){
                                        Image(optionSelected[index])
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                    }else{
                                        Image(options[index])
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.calculateDistance()
        }
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
