//
//  FindIntermediatePoints.swift
//  TravelMeitApp
//
//  Created by Katherine Caillahua Castillo on 21/06/23.
//

import Foundation
import CoreLocation

func findIntermediatePoints(startPoint: CLLocation, endPoint: CLLocation, allPoints: [CLLocation]) -> [CLLocation] {
    let sortedPoints = allPoints.sorted { point1, point2 in
        let distance1 = calculateDistance(startPoint, point1)
        let distance2 = calculateDistance(startPoint, point2)
        return distance1 < distance2
    }
    
    let startIndex = sortedPoints.firstIndex(of: startPoint) ?? 0
    let endIndex = sortedPoints.firstIndex(of: endPoint) ?? allPoints.count - 1
    
    let intermediatePoints = Array(sortedPoints[(startIndex + 1)...(endIndex - 1)])
    let limitedIntermediatePoints = Array(intermediatePoints.prefix(5))

    return intermediatePoints
}

func calculateDistance(_ startPoint: CLLocation, _ endPoint: CLLocation) -> Double {
    let lat1 = startPoint.coordinate.latitude
    let lon1 = startPoint.coordinate.longitude
    let lat2 = endPoint.coordinate.latitude
    let lon2 = endPoint.coordinate.longitude
    
    // Cálculo de distancia utilizando la fórmula de Haversine
    
    let earthRadius = 6371.0  // Radio de la Tierra en kilómetros
    
    let deltaLat = (lat2 - lat1).toRadians()
    let deltaLon = (lon2 - lon1).toRadians()
    
    let a = sin(deltaLat / 2) * sin(deltaLat / 2) + cos(lat1.toRadians()) * cos(lat2.toRadians()) * sin(deltaLon / 2) * sin(deltaLon / 2)
    let c = 2 * atan2(sqrt(a), sqrt(1 - a))
    
    let distance = earthRadius * c
    
    return distance
}

extension Double {
    func toRadians() -> Double {
        return self * .pi / 180.0
    }
}
