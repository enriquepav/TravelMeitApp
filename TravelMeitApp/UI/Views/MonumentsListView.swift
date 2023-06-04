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
    @StateObject var locationManager = LocationManager()
    @ObservedObject var viewModel = MonumentsListViewModel()
    let zeroPoint = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    var userCoordinate: CLLocationCoordinate2D{
        locationManager.requestLocation()
        while locationManager.location?.latitude == zeroPoint.latitude && locationManager.location?.longitude == zeroPoint.longitude {
            locationManager.requestLocation()
        }
        return locationManager.location ?? viewModel.coordinateZero
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer(minLength: 150)
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 20),
                    GridItem(.flexible(), spacing: 20)
                ], spacing: 300) {
                    ForEach(viewModel.monumentsData, id: \.id) { item in
                        NavigationLink(destination: MonumentDetailView(image: "barrancoframe", name: item.monument, distance: Float(viewModel.calculateDistance(point1: userCoordinate, point2: CLLocationCoordinate2D(latitude: item.Lattitude ?? 0.00, longitude: item.Longitude ?? 0.00))),textShort: item.short ?? "No Speech", textMedium: item.medium ?? "No Speech", textLong: item.long ?? "No Speech")) {
                            MonumentCelView(monumentImage: "barrancoframe", distance: Float(viewModel.calculateDistance(point1: userCoordinate, point2: CLLocationCoordinate2D(latitude: item.Lattitude ?? 0.00, longitude: item.Longitude ?? 0.00))), title: item.monument,textShort: item.short ?? "No Speech", textMedium: item.medium ?? "No Speech", textLong: item.long ?? "No Speech")
                        }
                     }
                }
                .padding()
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
                                    viewModel.callFuncToGetEmpData()
                                    selectedOption = index
                                    print(FilterManager.sharedInstance.distanceSelected)
                                    viewModel.callFuncToGetEmpData()// Actualizar el estado de selección al hacer clic en la opción
                                }) {
                                    Image(options[index])
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .background(selectedOption == index ? Color.blue.opacity(0.5) : Color.clear) // Marcar la opción seleccionada
                                }
                            }
                        }
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
