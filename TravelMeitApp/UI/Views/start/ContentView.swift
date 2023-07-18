//
//  ContentView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 17/05/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var appSettings = AppSettings()
    @StateObject private var userData = UserData()
    @ObservedObject var locationManager = LocationManager.shared

    var body: some View {
        NavigationView {
            ZStack {
                Image("bg_start")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 3)
                VStack {
                    Spacer()
                    Image("logoTravelmeit")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .scaledToFit()
                        .shadow(color: .black, radius: 4, x: 0, y: 2)
                        .frame(width: 300)
                        .border(.red)
                    Text("Where do you want to go today?")
                        .foregroundColor(.white)
                        .font(.custom("quicksand", size: 16))
                        .shadow(color: .black, radius: 4, x: 0, y: 2)
                        .border(.red)
                    Spacer()
                    NavigationLink(destination: {
                        if (appSettings.isUserCreated){
                            MonumentsListView()
                        } else {
                            CreateAccountView()
                        }
                    }) {
                        Image("buttonStart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .border(.red)
                    }
                    Spacer()
                    HStack {
                        Text("If you haven't an account")
                            .foregroundColor(.secondColor)
                            .font(.custom("quicksand", size: 12))
                        NavigationLink(destination: MonumentsListView()) {
                            Text("click here to create")
                                .foregroundColor(.secondColor)
                                .font(.custom("quicksand", size: 12)).bold()
                        }
                    }.border(.red)
                    Spacer()
                }
            }.overlay(alignment: .bottom, content: {
                ZStack {
                    Rectangle()
                        .fill(Color.principalColor)
                        .frame(width: 350,height: 60)
                        .cornerRadius(20)
                        .offset(y: 40)
                        .padding()
                }.cornerRadius(10).padding(-34)
            })
        }
        .border(.red)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
        .environmentObject(userData).onAppear(){
            locationManager.requestLocation()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
