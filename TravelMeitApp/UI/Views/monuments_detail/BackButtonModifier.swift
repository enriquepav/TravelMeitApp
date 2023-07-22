//
//  BackButtonModifier.swift
//  TravelMeitApp
//
//  Created by Enrique Alata Vences on 21/07/23.
//

import SwiftUI

struct BackButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithTransparentBackground()
                appearance.buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.red] // Cambia el color del texto del botón "Back" aquí
                
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
    }
}

extension View {
    func backButtonColor(_ color: Color) -> some View {
        self.modifier(BackButtonModifier())
    }
}
