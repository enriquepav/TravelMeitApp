//
//  UserRegistered.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 8/06/23.
//

import Foundation

struct User: Decodable, Encodable {
    
    var name: String = ""
    var mail: String = ""
    var emergencyData: String = ""
    var selectedCountry : String = ""
    var selectedLanguage : String = ""
    var selectedDate: String = ""
    var sizeType : String = ""
    var selectedOptionIDs: Set<String> = []
}
