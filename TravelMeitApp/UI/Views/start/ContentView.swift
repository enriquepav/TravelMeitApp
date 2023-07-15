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
                        .frame(height: 330)
                    Image("logoTravelmeit")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .scaledToFit()
                        .frame(width: 300)
                        
        
                    Text("Where do you want to go today?")
                        .foregroundColor(.white)
                        .font(.custom("quicksand", size: 16))
                        .shadow(color: .black, radius: 4, x: 0, y: 2)
                    Spacer()
                        .frame(height: 100)
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
                    }
                    Spacer()
                    HStack {
                        Text("If you haven't an account")
                            .foregroundColor(.secondColor)
                            .font(.custom("quicksand", size: 11))
                        Text("If you haven't an account")
                            .foregroundColor(.secondColor)
                            .font(.custom("quicksand", size: 11))
                            .bold()

                        
                    }
                    Spacer()
                }
            }.overlay(alignment: .bottom, content: {
                ZStack {
                    Rectangle()
                        .fill(Color.principalColor)
                        .frame(width: 350,height: 60)
                        .cornerRadius(30)
                        .offset(y: 40)
                        .padding()
                }.cornerRadius(10).padding(-34)
            })
        }.environmentObject(userData).onAppear(){
            locationManager.requestLocation()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
