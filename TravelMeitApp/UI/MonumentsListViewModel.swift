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
    let newList = [MonumentData]
    
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
    
    //La primera vez carga con el orden por valoración y 3km  -> lista1
    func callFuncToGetEmpData(user: User) {
        
        // ordenamiento por valoración sortBy
        
        newList = getListWithRating(user: user, list: apiService.apiToGetMonumentsData()).sort(by: rating)
       
        self.monumentsData = newList.filter {
            Float(self.calculateDistance(point1: self.userCoordinate, point2: CLLocationCoordinate2D(latitude: $0.latitude , longitude: $0.longitude ))) < FilterManager.sharedInstance.distanceSelected
            }
        }
    
    func getListWithRating(user: User, list: [MonumentData]) -> [MonumentData]{
        return list.forEach { item ->
            item.rating = getRating(user, item)
        }
    }
    
    func getRating(user: User, data: MonumentData) -> Int{
        var generalValue = data.general
        var historicValue = data.historic
        var landscape = data.landscape
        var artist = data.artist

        user.selectedOptionIDs.forEach { option ->
            switch option {
            case 0: generalValue = generalValue * 2
            case 1: historicValue = historicValue * 2
            case 2: landscape = landscape * 2
            case 3: artist = artist * 2
            default : {}
            }
        }
        return generalValue + historicValue + landscape + artist
    }
    
    
    // Función para ordenar por distancia de 3km sobre lista 1
    


    
    
    func calculateDistance(point1: CLLocationCoordinate2D, point2: CLLocationCoordinate2D) -> CLLocationDistance {
           let location1 = CLLocation(latitude: point1.latitude, longitude: point1.longitude)
           let location2 = CLLocation(latitude: point2.latitude, longitude: point2.longitude)
           
           return location1.distance(from: location2) / 1000
       }
    
}
