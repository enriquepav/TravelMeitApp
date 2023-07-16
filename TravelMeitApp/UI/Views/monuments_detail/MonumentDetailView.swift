//
//  MonumentDetailView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 28/05/23.
//

import SwiftUI
import CoreLocation
import SDWebImageSwiftUI

struct MonumentDetailView: View {
    @State private var isChecked: Bool = false
    @State private var isActive: Bool = false
    @State var monumentData: MonumentData
    @State var typeLong: String = "km."
    @State var showGoto = false
    @State var showAudio = false
    @State private var didTap45:Bool = false
    @State private var didTap15:Bool = false
    @State private var didTap3:Bool = false
    @StateObject var viewModel = MonumentsDetailViewModel()
    @ObservedObject var listViewModel = MonumentsListViewModel.shared
    @State var textToSpeech = ""
    @State private var isSpeaking = false
    @State private var isPausedSpeech = false
    @StateObject private var textToSpeechManager = TextToSpeechManager()

    var body: some View {
        NavigationView {
            ZStack{
                WebImage(url: URL(string: monumentData.image))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                HStack {
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0) {
                        Spacer().frame(height: 70)
                        
                        HStack {
                            Button(action: {
                                isChecked.toggle()
                            }) {
                                HStack {
                                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                        .foregroundColor(isChecked ? .blue : .gray)
                                        .imageScale(.large)
                                }
                            }.padding(5)
                            Text(monumentData.monument).foregroundColor(.white)
                                .font(.custom("quicksand", size: 14))
                                .bold()
                                .padding()
                            
                        }
                        .background(RoundedCorners(color: .principalColor, tl: 5, tr: 5, bl: 5, br:5))
                        
                        Label{
                            Text(String(format: "%.2f" + " " + typeLong, monumentData.distance))
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .bold))
                                .padding(5)
                        } icon: {
                            Image("ic_location")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 10)
                                .padding(5)
                        }
                        .background(
                            RoundedCorners(color: .thirdColor, tl: 0, tr: 0, bl: 5, br:5))
                        .padding(.trailing, 15)
                        Spacer()
                        
                    }.overlay(alignment:.bottom, content:{
                        VStack {
                            VStack {
                                Button(action: {
                                    if (!showAudio){
                                        self.showAudio = true
                                    }else{
                                        self.showAudio = false
                                    }
                                }, label: {
                                    Image("listen_to")
                                        .resizable()
                                        .frame(width: 170, height: 45)
                                })
                                
                                if (showAudio){
                                    Text("Choose the audio duration")
                                        .foregroundColor(Color.principalColor)
                                        .font(.custom("", size: 12).bold())
                                        .frame(width: 200, height: 20)
                                        .multilineTextAlignment(.center)
                                    
                                    HStack{
                                        Button(action: {
                                            self.didTap45 = true
                                            self.didTap15 = false
                                            self.didTap3 = false
                                            textToSpeech = self.monumentData.short
                                            
                                        }, label: {
                                            Text("45 seg")
                                                .frame(width: 45, height: 8)
                                                .padding()
                                                .foregroundColor(didTap45 ? Color.white : Color.principalColor).font(.system(size: 13))
                                        }).background(didTap45 ? Color.thirdColor : Color.white).cornerRadius(10)

                                        Button(action: {
                                            self.didTap15 = true
                                            self.didTap45 = false
                                            self.didTap3 = false
                                            textToSpeech = self.monumentData.medium
                                        }, label: {
                                            Text("1.5 min")
                                                .frame(width: 45, height: 8)
                                                .padding()
                                                .foregroundColor(didTap15 ? Color.white : Color.principalColor).font(.system(size: 13))
                                        }).background(didTap15 ? Color.thirdColor : Color.white).cornerRadius(10)
                                        
                                        Button(action: {
                                            self.didTap3 = true
                                            self.didTap15 = false
                                            self.didTap45 = false
                                            textToSpeech = self.monumentData.long
                                        }, label: {
                                            Text("3 min")
                                                .frame(width: 45, height: 8)
                                                .padding()
                                                .foregroundColor(didTap3 ? Color.white : Color.principalColor).font(.system(size: 13))
                                        }).background(didTap3 ? Color.thirdColor : Color.white).cornerRadius(10)
                                    }
                                    
                                    HStack{
                                        Button(action: {
                                            if isSpeaking {
                                                //viewModel.pausarReproduccion()
                                                textToSpeechManager.pauseSpeech()
                                                self.isSpeaking = false
                                                self.isPausedSpeech = true
                                            } else {
                                                if isPausedSpeech {
                                                    //viewModel.reanudarReproduccion()
                                                    textToSpeechManager.continueSpeech()
                                                    self.isSpeaking = true
                                                    self.isPausedSpeech = false
                                                } else {
                                                    textToSpeechManager.speakText(textToSpeech)
                                                    //viewModel.reproducirTextoEnDialogo(texto: textToSpeech)
                                                    self.isSpeaking = true
                                                }
                                            }
                                            
                                        }, label: {
                                            Image(self.isSpeaking ? "ic_pausenew" : "btn_play")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .padding()
                                        })
                                       /* .onAppear {
                                            self.viewModel.configurarAudioEnSegundoPlano()
                                                }*/
                                       
                                        Button(action: {
                                            //viewModel.terminarReproduccion()
                                            textToSpeechManager.stopSpeech()

                                            self.isSpeaking = false
                                            self.isPausedSpeech = false
                                        }, label: {
                                            Image("btn_stop")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .padding()
                                        })
                                    }
                                }
                            }.padding(EdgeInsets(top: 20, leading: 40, bottom: 10, trailing:50))
                            
                            VStack {
                                Button(action: {
                                    if (!showGoto){
                                        self.showGoto = true
                                    }else{
                                        self.showGoto = false
                                    }
                                }, label: {
                                    Image("go_to")
                                        .resizable()
                                        .frame(width: 170, height: 45)
                                        .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                                })
                                
                                if (showGoto){
                                    Text("Do you want to stop along the way?")
                                        .foregroundColor(Color.principalColor)
                                        .font(.system(size: 10).bold())
                                        .multilineTextAlignment(.center)
                                    
                                    NavigationLink(destination: {
                                        /*let locations = [
                                            CLLocation(latitude: viewModel.userCoordinate.coordinate.latitude, longitude: viewModel.userCoordinate.coordinate.longitude), // Point 1
                                            CLLocation(latitude: monumentData.latitude, longitude: monumentData.longitude) // Point 2
                                        ]*/
                                        let result = viewModel.findLocations(monumentCoordinate: monumentData, allCoordinates: listViewModel.monumentsData)
                                        MapRouteView(locations: result.1 , monumentsList: result.0)
                                    }
                                    ){
                                        Text("Yes")
                                            .frame(width: 100, height: 10)
                                            .padding()
                                            .background(Color.thirdColor)
                                            .cornerRadius(20)
                                            .foregroundColor(Color.white)
                                    }
                                    
                                    Button(action: {}, label: {
                                        Text("No")
                                            .frame(width: 100, height: 10)
                                            .padding()
                                            .background(Color.white)
                                            .cornerRadius(20)
                                            .foregroundColor(Color.principalColor)
                                    })
                                }
                            }
                            HStack {
                                Image("buy_ticket")
                                    .resizable()
                                    .frame(width: 170, height: 45)
                            }.padding(EdgeInsets(top: 5, leading: 40, bottom: 10, trailing: 40))
                        }
                        .background(Color.white.opacity(0.7)) // Fondo translúcido
                        .cornerRadius(10) // Esquinas redondeadas
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: -30, trailing: 50))
                    })
                    .scaledToFill().padding(30)
                }
            }.navigationBarBackButtonHidden(true)
        }.onAppear(){
            // Solicitar permiso para mostrar notificaciones
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in
                // Manejar la respuesta de autorización si es necesario
            }
        }.background(EmptyView().onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            // Cuando la aplicación pasa a segundo plano, muestra la notificación
            showAudioNotification()
        })
    }
    
    // Función para mostrar la notificación con controles de reproducción
    func showAudioNotification() {
        // Configurar las acciones de reproducción
        let playAction = UNNotificationAction(identifier: "play", title: "Play", options: [])
        let pauseAction = UNNotificationAction(identifier: "pause", title: "Pause", options: [])
        let stopAction = UNNotificationAction(identifier: "stop", title: "Stop", options: [])

        // Configurar la categoría de notificación con las acciones de reproducción
        let category = UNNotificationCategory(identifier: "audioPlayback", actions: [playAction, pauseAction, stopAction], intentIdentifiers: [], options: .customDismissAction)
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        // Configurar el contenido de la notificación
        let content = UNMutableNotificationContent()
        content.title = "Reproduciendo audio"
        content.body = "Pulsa para pausar"
        content.categoryIdentifier = "audioPlayback"
        
        // Configurar la solicitud de notificación
        let request = UNNotificationRequest(identifier: "audioNotification", content: content, trigger: nil)
        
        // Agregar la solicitud de notificación al centro de notificaciones
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error al agregar la solicitud de notificación: \(error)")
            }
        }
    }
}

struct MonumentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentDetailView(monumentData: MonumentData(pais: "Spain",
                                                   ciudad: "Barcelona",
                                                   district: "Eixample",
                                                   latitude: 41.3851,
                                                   longitude: 2.1734,
                                                   general: 5,
                                                   historic: 4,
                                                   landscape: 3,
                                                   artist: 4,
                                                   party: 3,
                                                   monument: "Sagrada Familia",
                                                   short: "Gaudí's masterpiece",
                                                   medium: "The Sagrada Familia is a renowned basilica...",
                                                   long: "The Sagrada Familia is a monumental basilica...",
                                                   image:"https://www.wagnerproducciones.com/travelmeit/monumentos_tallinn/raekoja%20plats.jpg",
                                                   rating: 4,
                                                   distance: 2.5))
    }
}
