//
//  MapRouteView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 17/06/23.
//

import SwiftUI
import CoreLocation

struct MapRouteView: View {
    
    let locations = [
        CLLocation(latitude: 37.7749, longitude: -122.4194), // Point 1
        CLLocation(latitude: 34.0522, longitude: -118.2437), // Point 2
        CLLocation(latitude: 47.6062, longitude: -122.3321), // Point 3
        CLLocation(latitude: 40.7128, longitude: -74.0060)   // Point 4
    ]
    
    var body: some View {
        VStack {
            MapView(locations: locations)
                .edgesIgnoringSafeArea(.all)
            
            // Other UI elements...
        }
    }
}

struct MapRouteView_Previews: PreviewProvider {
    static var previews: some View {
        MapRouteView()
    }
}
