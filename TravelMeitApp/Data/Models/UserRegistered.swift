//
//  UserRegistered.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 8/06/23.
//

import Foundation

struct User {
    
    var name: String = ""
    var mail: String = ""
    var emergencyData: String = ""
    var selectedCountry : String = ""
    var selectedLanguage : String = ""
    var selectedDate: Date
    var sizeType : String = ""
    var selectedOptionIDs: Set<UUID> = []
    
}
