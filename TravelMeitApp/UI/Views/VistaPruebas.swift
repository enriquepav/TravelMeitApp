//
//  VistaPruebas.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI
import AVFoundation

struct VistaPruebas: View {
    @State private var showAlert = false
    @State private var navigateToNextView = false
       
       var body: some View {
           NavigationView {
               VStack {
                          Button(action: {
                              showAlert = true
                          }) {
                              Text("Mostrar Alerta")
                          }
                          .padding()
                          .alert(isPresented: $showAlert) {
                              Alert(
                                  title: Text("Alerta"),
                                  message: Text("¿Deseas continuar?"),
                                  primaryButton: .default(Text("Sí"), action: {
                                      navigateToNextView = true
                                  }),
                                  secondaryButton: .cancel()
                              )
                          }
                          
                          NavigationLink(
                              destination: MonumentsListView(),
                              isActive: $navigateToNextView
                          ) {
                              EmptyView()
                          }
                          .hidden()
                      }
           }
       }
    
}
struct VistaPruebas_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas()
    }
}
