//
//  APIService.swift
//  TravelMeitApp
//
//  Created by Katherine Caillahua Castillo on 29/05/23.
//

import Foundation

class APIService :  ObservableObject {
    
    func apiToGetMonumentsData() -> [MonumentData] {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode([MonumentData].self, from: monumentsData)
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
        return []
    }
    
    func apiToGetDistricts() -> [District] {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode([District].self, from: districtsData)
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
        return []
    }
}
