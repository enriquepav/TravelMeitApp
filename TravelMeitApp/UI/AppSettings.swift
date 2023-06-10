//
//  AppSettings.swift
//  TravelMeitApp
//
//  Created by Katherine Caillahua Castillo on 9/06/23.
//

import Foundation

class AppSettings: ObservableObject {
    /*@Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }*/
    
    @Published var isUserCreated: Bool {
        didSet {
            UserDefaults.standard.set(isUserCreated, forKey: "isUserCreated")
        }
    }
    
   /* @Published var ringtone: String {
        didSet {
            UserDefaults.standard.set(ringtone, forKey: "ringtone")
        }
    }
    
    public var ringtones = ["Chimes", "Signal", "Waves"]*/
    
    init() {
        //self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        self.isUserCreated = UserDefaults.standard.object(forKey: "isUserCreated") as? Bool ?? false
        //self.ringtone = UserDefaults.standard.object(forKey: "ringtone") as? String ?? "Chimes"
    }
}
