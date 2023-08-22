//
//  LocationManagerNotify.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 21/08/23.
//

import Foundation
import AVFoundation
import CoreLocation
import UserNotifications

class LocationManagerNotify: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private var locationManager = CLLocationManager()
    private let targetLocation = CLLocationCoordinate2D(latitude: 10.00, longitude: 10.00)
    private let regionIdentifier = "TargetRegion"

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startMonitoringTargetRegion(targetLocation1: CLLocationCoordinate2D) {
        let region = CLCircularRegion(center: targetLocation1, radius: 770, identifier: regionIdentifier)
        region.notifyOnEntry = true
        locationManager.startMonitoring(for: region)
        showNotification()
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if region.identifier == regionIdentifier {
            DispatchQueue.main.async {
                self.showNotification()
            }
        }
    }
    
    func showNotification() {
        let content = UNMutableNotificationContent()
        content.title = "NOTIFICACION DE CERCANIA"
        content.body = "Estas llegando al punto esperado"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification scheduled successfully.")
            }
        }
    }
}
