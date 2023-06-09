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
    @State var monumentsList: [MonumentData]?
    @State var typeLong: String = "km."
    @State private var selectedMarker: GMSMarker? = nil
    @ObservedObject var viewModel = MapRouteViewModel.shared
    @State private var isCheckboxChecked = false

    var body: some View {
        VStack {
            VStack{
                HStack{
                    Image("ic_heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                    
                    Text("Choose your stops:")
                        .foregroundColor(Color.principalColor)
                        .font(.system(size: 20).bold()).padding(5)
                    Spacer()
                }
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.fixed(50))], spacing: 15) {
                        ForEach(monumentsList!, id: \.monument) { item in
                            NavigationLink(destination: MonumentDetailView(monumentData: item)) {
                                MonumentCelView(isCheckboxChecked: $isCheckboxChecked, monumentImage:item.image, distance: item.distance, title: item.monument)
                            }
                        }
                    }
                    .padding()
                }
            }.background(Color.secondColor).cornerRadius(20).padding(EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 10))
            
            MapView(locations: locations, monumentsData: monumentsList!, selectedMarker: $selectedMarker)
                .edgesIgnoringSafeArea(.all).cornerRadius(20).padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            HStack{
                Text("your\ntotal")
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
                    
                    Text(String(format: "%.2f" + " " + typeLong, "3"))
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold))
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                
                }.background(
                    RoundedCorners(color: .thirdColor, tl: 10, tr: 10, bl: 10, br:10))
                .padding(.trailing, 10)
                
                Button(action: {
                }, label: {
                    Text("Start!")
                        .frame(width: 80, height: 8)
                        .padding()
                        .foregroundColor(Color.white)
                }).background(Color.principalColor).cornerRadius(20).padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 10))
            
            }.background(Color.white).cornerRadius(20).padding(EdgeInsets(top: 20, leading: 10, bottom: 25, trailing: 10))
            // Other UI elements...
        }.navigationBarBackButtonHidden(true).background(Color.principalColor).cornerRadius(20).padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)).onDisappear(){
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
    }
}

struct MapRouteView_Previews: PreviewProvider {
    static var previews: some View {
        let locations = [
            CLLocation(latitude: 37.7749, longitude: -122.4194), // Point 1
            CLLocation(latitude: 34.0522, longitude: -118.2437), // Point 2
            CLLocation(latitude: 47.6062, longitude: -122.3321), // Point 3
            CLLocation(latitude: 40.7128, longitude: -74.0060)   // Point 4
        ]
        MapRouteView(locations: locations, monumentsList: nil)
    }
}
