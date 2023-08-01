//
//  TextToSpeechManager.swift
//  TravelMeitApp
//
//  Created by Katherine Caillahua Castillo on 28/06/23.
//

import Foundation
import AVFoundation

class TextToSpeechManager: NSObject, ObservableObject, AVSpeechSynthesizerDelegate {
    static let shared = TextToSpeechManager()
    let speechSynthesizer = AVSpeechSynthesizer()

    private override init() {
        super.init()
        speechSynthesizer.delegate = self
        // Configura la sesión de audio para reproducir en segundo plano
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try? AVAudioSession.sharedInstance().setActive(true)
    }

    func speakText(_ text: String) {
        stopSpeech()
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US") // Establece el idioma de la voz
        speechSynthesizer.speak(speechUtterance)
    }

    func pauseSpeech() {
        speechSynthesizer.pauseSpeaking(at: .immediate)
    }

    func continueSpeech() {
        speechSynthesizer.continueSpeaking()
    }

    func stopSpeech() {
        speechSynthesizer.stopSpeaking(at: .immediate)
    }

    // AVSpeechSynthesizerDelegate
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        // La lectura del texto ha finalizado
    }
}
