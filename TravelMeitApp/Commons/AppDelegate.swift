//
//  AppDelegate.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 17/06/23.
//

import GoogleMaps
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyC9LY0k_YloKpu_Ip2Amu82DPElu4jda_U")
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
                    if granted {
                        print("Notification permission granted")
                    } else if let error = error {
                        print("Notification permission denied: \(error)")
                    }
                }
                
        return true
    }
}
