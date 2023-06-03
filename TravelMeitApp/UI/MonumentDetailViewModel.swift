//
//  MonumentDetailViewModel.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 3/06/23.
//

import Foundation
import AVFoundation

final class MonumentsDetailViewModel: ObservableObject {
    let synthesizer = AVSpeechSynthesizer()
    
    
    
    func reproducirTextoEnDialogo(texto: String) {
        
        let utterance = AVSpeechUtterance(string: texto)
        
        // Configurar el estilo y la voz del discurso (opcional)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5  // Velocidad del discurso (0.0 a 1.0)
        
        synthesizer.speak(utterance)
    }

    
    
    
    
    
    
    
}
