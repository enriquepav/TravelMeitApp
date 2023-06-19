//
//  MonumentDetailViewModel.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 3/06/23.
//

import Foundation
import AVFoundation
import CoreLocation

final class MonumentsDetailViewModel: ObservableObject {
    let synthesizer = AVSpeechSynthesizer()
    private let locationManager = LocationManager.shared
    let zeroPoint = CLLocationCoordinate2D(latitude: 0, longitude: 0)

    var userCoordinate: CLLocation{
        while locationManager.currentLocation == nil || locationManager.currentLocation?.coordinate.longitude == zeroPoint.longitude {
            locationManager.requestLocation()
        }
        return locationManager.currentLocation!
    }

    
    func reproducirTextoEnDialogo(texto: String) {
        
        let utterance = AVSpeechUtterance(string: texto)
        
        // Configurar el estilo y la voz del discurso (opcional)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5  // Velocidad del discurso (0.0 a 1.0)
        
        synthesizer.speak(utterance)
    }

    func pausarReproduccion() {
        self.synthesizer.pauseSpeaking(at: .word)
    }
    
    func reanudarReproduccion() {
        self.synthesizer.continueSpeaking()
    }
    
    func terminarReproduccion() {
        self.synthesizer.stopSpeaking(at: .immediate)
    }
    
    func configurarAudioEnSegundoPlano() {
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print("Error al configurar el audio en segundo plano: \(error.localizedDescription)")
            }
        }
    
}
