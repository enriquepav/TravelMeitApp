//
//  MapRouteView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 17/06/23.
//

import SwiftUI
import CoreLocation
import GoogleMaps

struct MapRouteView: View {
    
    @State var locations: [CLLocation]
    @State var monumentsList: [MonumentData]
    @State var showOnlyFirstElement : Bool
    @State private var selectedMarker: GMSMarker? = nil
    @ObservedObject var viewModel = MapRouteViewModel.shared
    @State private var isCheckboxChecked = false
    @State private var selectedItems: [MonumentData] = []
    @State private var locationItems: [CLLocation] = []
    @ObservedObject var viewModel1 = MonumentsListViewModel.shared
    @State var supportArray = [0,0]

    var body: some View {
        VStack {
            VStack{
                HStack{
                    Image("ic_heart")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 25, height: 25)
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                    
                    Text("Choose your stops:")
                        .foregroundColor(Color.white)
                        .font(.custom("quicksand", size: 20).bold()).padding(5)
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.fixed(30))], spacing: 5) {
                        ForEach(Array(viewModel1.monumentsData.enumerated()), id: \.1.monument) { (index, item) in
                            if !showOnlyFirstElement || index == 0 {
                                ZStack {
                                    MonumentCelMapView(monumentImage: item.image, title: item.monument)
                                    VStack {
                                        HStack {
                                            Checkbox(isChecked: Binding(
                                                get: {
                                                    selectedItems.contains(item)
                                                },
                                                set: { value in
                                                    if index == 0 {
                                                        // No permitir desmarcar el primer elemento
                                                        return
                                                    }
                                                    if value {
                                                        viewModel.clearTotalDuration()
                                                        selectedItems.append(item)
                                                        locations.append(CLLocation(latitude: item.latitude, longitude: item.longitude))
                                                        supportArray.append(index)
                                                        var pairs = [(CLLocation, Int)]()
                                                        for i in 0...(locations.count-1) {
                                                            pairs.append((locations[i], supportArray[i]))
                                                        }
                                                        let referenceLocation = pairs[0].0
                                                        reorderTuplesByDistance(from: referenceLocation, varTuples: &pairs)
                                                        var locationList: [CLLocation] = []
                                                        var intList: [Int] = []

                                                        for tuple in pairs {
                                                            locationList.append(tuple.0)
                                                            intList.append(tuple.1)
                                                        }
                                                        
                                                        locations = locationList
                                                        supportArray = intList
                                                    
                                                        monumentsList = selectedItems
                                                    } else {
                                                        viewModel.clearTotalDuration()
                                                        selectedItems.removeAll { $0 == item }
                                                        let position = supportArray.firstIndex(of: index)
                                                        supportArray.removeAll { $0 == index }
                                                        locations.remove(at: position!)
                                                        var pairs = [(CLLocation, Int)]()
                                                        for i in 0...(locations.count-1) {
                                                            pairs.append((locations[i], supportArray[i]))
                                                        }
                                                        let referenceLocation = pairs[0].0
                                                        reorderTuplesByDistance(from: referenceLocation, varTuples: &pairs)
                                                        var locationList: [CLLocation] = []
                                                        var intList: [Int] = []

                                                        for tuple in pairs {
                                                            locationList.append(tuple.0)
                                                            intList.append(tuple.1)
                                                        }
                                                        
                                                        locations = locationList
                                                        supportArray = intList
                                                        
                                                        monumentsList = selectedItems
                                                    }
                                                }
                                            ))
                                        }
                                    }
                                }.frame(width: 150, height: 280)
                                    .padding()
                            }
                        }
                    }
                }.background(Color.secondColor).cornerRadius(20).padding(EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 10))
                
                MapView(locations: $locations, monumentsData: $monumentsList, selectedMarker: $selectedMarker)
                    .edgesIgnoringSafeArea(.all).cornerRadius(20).padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                
                HStack {
                    Text("Your\ntotal")
                        .foregroundColor(Color.thirdColor)
                        .font(.system(size: 12).bold()).padding(10)
                        .frame(width: 50, height: 50)
                    
                    HStack{
                        
                        Image("ic_location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 10)
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                        
                        Text(viewModel.formattedDuration(viewModel.totalDuration))
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .bold))
                            .padding(EdgeInsets(top: 0, leading: -5, bottom: 0, trailing: 0))
                        
                        Text("/")
                            .foregroundColor(Color.white)
                            .font(.system(size: 12).bold())
                        
                        Image("ic_location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 10)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        Text(viewModel.formattedDistance(viewModel.totalDistance))
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .bold))
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                        
                    }.background(
                        RoundedCorners(color: .thirdColor, tl: 10, tr: 10, bl: 10, br:10))
                    .padding(.trailing, 10)
                    
                    Button(action: {
                        
                        for monument in selectedItems {
                            print(monument.monument)
                            
                        }
                        print("pruebasEPAV")
                        print(supportArray)
                        
                        for i in locations {
                            print (i)
                        }
                        
                    }, label: {
                        Text("Start!")
                            .frame(width: 80, height: 8)
                            .padding()
                            .foregroundColor(Color.white)
                    }).background(Color.principalColor).cornerRadius(20).padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10))
                    
                }.background(Color.white).cornerRadius(20).padding(EdgeInsets(top: 20, leading: 10, bottom: 25, trailing: 10))
                // Other UI elements...
            }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
                .edgesIgnoringSafeArea(.all).background(Color.principalColor).cornerRadius(20).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)).onDisappear(){
                    viewModel.clearTotalDuration()
                }.overlay(alignment: .bottom, content: {
                    ZStack {
                        Rectangle()
                            .fill(Color.secondColor)
                            .frame(width: 400,height: 80)
                            .cornerRadius(20)
                            .offset(y: 40)
                            .padding()
                    }.cornerRadius(10).padding(-34)
                })
        
        }.onAppear {
            selectedItems.append(viewModel1.monumentsData.first!)
            monumentsList = selectedItems
        }
        
    }
    
    func reorderTuplesByDistance(from referenceLocation: CLLocation, varTuples: inout [(CLLocation, Int)]) {
        varTuples.sort(by: {
            $0.0.distance(from: referenceLocation) < $1.0.distance(from: referenceLocation)
        })
    }
    
}

/*struct MapRouteView_Previews: PreviewProvider {
    static var previews: some View {
        let locations = [
            CLLocation(latitude: 37.7749, longitude: -122.4194), // Point 1
            CLLocation(latitude: 34.0522, longitude: -118.2437), // Point 2
            CLLocation(latitude: 47.6062, longitude: -122.3321), // Point 3
            CLLocation(latitude: 40.7128, longitude: -74.0060)   // Point 4
        ]
        MapRouteView(locations: locations, monumentsList: nil)
    }
}*/
