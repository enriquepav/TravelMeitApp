//
//  MonumentsListViewModel.swift
//  TravelMeitApp
//
//  Created by Katherine Caillahua Castillo on 29/05/23.
//

import Foundation
import CoreLocation


final class MonumentsListViewModel: ObservableObject {
    static let shared = MonumentsListViewModel()
    private var apiService: APIService!
    @Published var monumentsData = [MonumentData]()
    @Published var coordinateZero : CLLocationCoordinate2D
    private let locationManager = LocationManager.shared
    let zeroPoint = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var newList : [MonumentData] = []
    @Published private var userData = UserData()
    @Published var isLoading = true

    var userCoordinate: CLLocation{
        while locationManager.currentLocation == nil || locationManager.currentLocation?.coordinate.longitude == zeroPoint.longitude {
            locationManager.requestLocation()
        }
        return locationManager.currentLocation!
    }

   private init(){
        coordinateZero = CLLocationCoordinate2D(latitude:-12.1471894081759, longitude: -77.02099655561172)
        self.apiService = APIService()
        self.callFuncToGetEmpData(user: userData.user!)
    }
    
    //La primera vez carga con el orden por valoración y 50km  -> lista1
    func callFuncToGetEmpData(user: User) {
        
        // ordenamiento por valoración sortBy
        self.newList = getListWithRating(user: user, list: apiService.apiToGetMonumentsData())
        self.monumentsData = newList.filter { item in
             item.distance < FilterManager.sharedInstance.distanceSelected
        }
    }
    
    func getListWithRating(user: User, list: [MonumentData]) -> [MonumentData] {
        return list.map { item in
            var updatedItem = item
            //calculamos valoración
            updatedItem.rating = getRating(user: user, data: item)
            updatedItem.image = "https://www.wagnerproducciones.com/travelmeit/monumentos/PUENTE%20DE%20LOS%20SUSPIROS%201.jpg"
            return updatedItem
        }
    }
    
    func getRating(user: User, data: MonumentData) -> Int {
        let generalValue = data.general
        var historical = data.historic
        var party = data.party
        var landscape = data.landscape
        var artist = data.artist
    
        for option in user.selectedOptionIDs {
            
            switch option {
            case "A" : historical = historical * 2
            case "B" : party = party * 2
            case "C" : landscape = landscape * 2
            case "D" : artist = artist * 2
            default:
                print("error en la selección de opciones")
            }
        }
        return generalValue + historical + party + landscape + artist
    }
    
    func filterByDistanceSelected(){
        self.monumentsData = newList.filter { item in
           return item.distance < FilterManager.sharedInstance.distanceSelected
        }
    }
    
    func calculateDistance(){
        var list : [MonumentData] = []
        for monument in newList {
            var updateMonument = monument
            updateMonument.distance = Float(self.calculateDistance(point1: self.userCoordinate.coordinate, point2: CLLocationCoordinate2D(latitude: updateMonument.latitude , longitude: updateMonument.longitude)))
            list.append(updateMonument)
        }
        newList = list
        self.monumentsData = newList
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
        }
    }
    
    
    func calculateDistance(point1: CLLocationCoordinate2D, point2: CLLocationCoordinate2D) -> CLLocationDistance {
           let location1 = CLLocation(latitude: point1.latitude, longitude: point1.longitude)
           let location2 = CLLocation(latitude: point2.latitude, longitude: point2.longitude)
           return location1.distance(from: location2) / 1000
       }
    
}
