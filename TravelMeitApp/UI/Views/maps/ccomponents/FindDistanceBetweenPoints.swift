//
//  FindDistanceBetweenPoints.swift
//  TravelMeitApp
//
//  Created by Katherine Caillahua Castillo on 28/06/23.
//

import CoreLocation

struct Point {
    let latitude: Double
    let longitude: Double
}

func distancia_entre_puntos(_ punto1: CLLocation, _ punto2: CLLocation) -> CLLocationDistance {
    // Crea dos instancias de CLLocation a partir de las coordenadas
    let ubicacion1 = CLLocation(latitude: punto1.coordinate.latitude, longitude: punto1.coordinate.longitude)
    let ubicacion2 = CLLocation(latitude: punto2.coordinate.latitude, longitude: punto2.coordinate.longitude)
    
    // Calcula la distancia en metros entre las dos ubicaciones
    return ubicacion1.distance(from: ubicacion2)
}

func encontrar_puntos_intermedios(puntos: [CLLocation], puntoA: CLLocation, puntoB: CLLocation, radio: CLLocationDistance) -> [CLLocation] {
    var puntosIntermedios = [CLLocation]()
    
    let puntoALocation = CLLocation(latitude: puntoA.coordinate.latitude, longitude: puntoA.coordinate.longitude)
    let puntoBLocation = CLLocation(latitude: puntoB.coordinate.latitude, longitude: puntoB.coordinate.longitude)
    
    for punto in puntos {
        let puntoLocation = CLLocation(latitude: punto.coordinate.latitude, longitude: punto.coordinate.longitude)
        
        // Calcula la distancia entre el punto actual y los puntos A y B
        let distanciaA = distancia_entre_puntos(puntoLocation, puntoALocation)
        let distanciaB = distancia_entre_puntos(puntoLocation, puntoBLocation)
        
        // Verifica si el punto está dentro del radio y lo agrega a la lista de puntos intermedios
        if distanciaA <= radio && distanciaB <= radio {
            puntosIntermedios.append(punto)
        }
    }
    
    return puntosIntermedios
}

