//
//  ContentView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 17/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("CiudadDifuminada")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                            .blur(radius: 3)
                VStack {
                    Spacer()
                        .frame(height: 300)
                    Image("logoTravelmeit")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 4, x: 0, y: 2)
                    Text("Where do you want to go today?")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .regular))
                        .shadow(color: .black, radius: 4, x: 0, y: 2)
                    Spacer()
                        .frame(height: 100)
                    NavigationLink(destination: CreateAccountView()) {
                        Image("buttonStart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    }
                    Spacer()
                    HStack {
                        Text("If you have an account")
                            .foregroundColor(.secondColor)
                            .font(.system(size: 12))
                        NavigationLink(destination: MonumentsListView()) {
                            Text("click here")
                                .foregroundColor(.secondColor)
                            .font(.system(size: 12, weight: .bold))
                        }
                        
                    }
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
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 100,height: 10)
                        .cornerRadius(20)
                        .offset(y:30)
                        .padding()
                }.cornerRadius(10).padding(-34)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
