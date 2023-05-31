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

    init(){
        coordinateZero = CLLocationCoordinate2D(latitude:-12.1471894081759, longitude: -77.02099655561172)
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetMonumentsData { (monumentsData) in
               self.monumentsData = monumentsData
           }
       }
    func calculateDistance(point1: CLLocationCoordinate2D, point2: CLLocationCoordinate2D) -> CLLocationDistance {
           let location1 = CLLocation(latitude: point1.latitude, longitude: point1.longitude)
           let location2 = CLLocation(latitude: point2.latitude, longitude: point2.longitude)
           
           return location1.distance(from: location2) / 1000
       }
    
}
