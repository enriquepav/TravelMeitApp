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
    let pais: String
    let ciudad: String
    let district: String
    let latitude, longitude: Double
    let general, historic, landscape, artist: Int
    let party: Int
    let monument, short, medium, long: String
    var image: String
    var rating: Int = 0
    var distance: Float = 0.0

    enum CodingKeys: String, CodingKey {
        case pais = "Pais"
        case ciudad = "Ciudad"
        case district = "District"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case general = "General"
        case historic = "Historic"
        case landscape = "Landscape"
        case artist = "Artist"
        case party = "Party"
        case monument = "Monument"
        case short = "Short"
        case medium = "Medium"
        case long = "Long"
        case image = "Image"
    }
}
