//
//  VistaPruebas.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI
import AVFoundation

struct VistaPruebas: View {
    let synthesizer = AVSpeechSynthesizer()
        @State private var isSpeaking = false
        
        var body: some View {
            VStack {
                Button(action: {
                    if self.isSpeaking {
                        self.pausarReproduccion()
                    } else {
                        self.iniciarReproduccion()
                    }
                }) {
                    Text(self.isSpeaking ? "Pausar" : "Reproducir")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    self.reanudarReproduccion()
                }) {
                    Text("Reanudar")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    self.terminarReproduccion()
                }) {
                    Text("Terminar")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        
        func iniciarReproduccion() {
            let utterance = AVSpeechUtterance(string: "¡Hola! Esto es un ejemplo de texto en diálogo.")
            utterance.voice = AVSpeechSynthesisVoice(language: "es-ES")
            utterance.rate = 0.5
            
            self.synthesizer.speak(utterance)
            self.isSpeaking = true
        }
        
        func pausarReproduccion() {
            self.synthesizer.pauseSpeaking(at: .word)
            self.isSpeaking = false
        }
        
        func reanudarReproduccion() {
            self.synthesizer.continueSpeaking()
            self.isSpeaking = true
        }
        
        func terminarReproduccion() {
            self.synthesizer.stopSpeaking(at: .immediate)
            self.isSpeaking = false
        }
}
    

struct VistaPruebas_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas()
    }
}
