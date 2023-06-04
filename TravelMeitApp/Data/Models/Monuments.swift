//
//  Monuments.swift
//  TravelMeitApp
//
//  Created by Katherine Caillahua Castillo on 29/05/23.
//

import Foundation

struct Monuments: Decodable {
    let record : [MonumentData]
}

struct MonumentData: Decodable {
    let id: Int
    let pais, ciudad, monument: String
    let short, medium, long, Image: String?
    let Lattitude, Longitude: Double?
    
    init(id: Int, pais: String, ciudad: String, monument: String, short: String, medium: String, long: String, Lattitude: Double, Longitude: Double, Image: String) {
        self.id = id
        self.pais = pais
        self.ciudad = ciudad
        self.monument = monument
        self.short = short.isEmpty ? "" : short
        self.medium = medium.isEmpty ? "" : medium
        self.long = long.isEmpty ? "" : long
        self.Lattitude = Lattitude.isNaN ? 0.0 : Lattitude
        self.Longitude = Longitude.isNaN ? 0.0 : Lattitude
        self.Image = Image.isEmpty ? "" : Image
    }

    enum CodingKeys: String, CodingKey {
        case id
        case pais = "Pais"
        case ciudad = "Ciudad"
        case monument = "Monument"
        case short = "Short"
        case medium = "Medium"
        case long = "Long"
        case Lattitude
        case Longitude
        case Image
    }
}
