//
//  MonumentsListViewModel.swift
//  TravelMeitApp
//
//  Created by Katherine Caillahua Castillo on 29/05/23.
//

import Foundation
import CoreLocation


final class MonumentsListViewModel: ObservableObject {
    private var apiService: APIService!
    @Published var monumentsData = [MonumentData]()
    @Published var coordinateZero : CLLocationCoordinate2D
    var locationManager = LocationManager()
    let zeroPoint = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    var userCoordinate: CLLocationCoordinate2D{
        locationManager.requestLocation()
        while locationManager.location?.latitude == zeroPoint.latitude && locationManager.location?.longitude == zeroPoint.longitude {
            locationManager.requestLocation()
        }
        return locationManager.location ?? coordinateZero
    }

    init(){
        coordinateZero = CLLocationCoordinate2D(latitude:-12.1471894081759, longitude: -77.02099655561172)
        self.apiService = APIService()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetMonumentsData { (monumentsData) in
            self.monumentsData = monumentsData.sorted(by: { Float(self.calculateDistance(point1: self.userCoordinate, point2: CLLocationCoordinate2D(latitude: $0.Lattitude ?? 0.00, longitude: $0.Longitude ?? 0.00))) < Float(self.calculateDistance(point1: self.userCoordinate, point2: CLLocationCoordinate2D(latitude: $1.Lattitude ?? 0.00, longitude: $1.Longitude ?? 0.00))) })
                .filter {
                    Float(self.calculateDistance(point1: self.userCoordinate, point2: CLLocationCoordinate2D(latitude: $0.Lattitude ?? 0.00, longitude: $0.Longitude ?? 0.00))) < FilterManager.sharedInstance.distanceSelected
                }
        }
    }
    
    
    func calculateDistance(point1: CLLocationCoordinate2D, point2: CLLocationCoordinate2D) -> CLLocationDistance {
           let location1 = CLLocation(latitude: point1.latitude, longitude: point1.longitude)
           let location2 = CLLocation(latitude: point2.latitude, longitude: point2.longitude)
           
           return location1.distance(from: location2) / 1000
       }
    
}
