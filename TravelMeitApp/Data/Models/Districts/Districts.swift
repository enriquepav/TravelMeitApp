//
//  Districts.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 6/08/23.
//

import Foundation

// MARK: - District

struct Districts: Decodable {
    let districts: [District]
}

struct District: Decodable {
    let pais, ciudad, district, resume: String
}

enum CodingKeys: String, CodingKey {
    case pais = "pais"
    case ciudad = "ciudad"
    case district = "district"
    case resume = "resume"
}
