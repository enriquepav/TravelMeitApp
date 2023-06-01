//
//  MonumentDetailView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 28/05/23.
//

import SwiftUI

struct MonumentDetailView: View {
    @State private var isChecked: Bool = false
    @State private var isActive: Bool = false
    @State var image: String
    @State var name: String
    @State var distance: Float
    @State var typeLong: String = "km."
    
    var body: some View {
        NavigationView {
            ZStack{
                Image(image)
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
                            Text(name).foregroundColor(.white).padding()
                            
                        }
                        .background(RoundedCorners(color: .principalColor, tl: 5, tr: 5, bl: 5, br:5))
                        
                        Label{
                            Text(String(format: "%.2f" + " " + typeLong, distance))
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
                            HStack {
                                Image(systemName: "globe")
                                    .imageScale(.large)
                                    .foregroundColor(.accentColor)
                                Text("Listen to!")
                            }
                            HStack {
                                Image(systemName: "globe")
                                    .imageScale(.large)
                                    .foregroundColor(.accentColor)
                                Text("Go to!")
                            }
                            HStack {
                                Image(systemName: "globe")
                                    .imageScale(.large)
                                    .foregroundColor(.accentColor)
                                Text("Buy ticket")
                            }
                        }
                        .background(Color.white.opacity(0.7)) // Fondo translúcido
                        .cornerRadius(10) // Esquinas redondeadas
                        .padding()
                    })
                    .scaledToFill().padding(30)
                }
            }.overlay(alignment: .bottom, content: {
                ZStack {
                    Rectangle()
                        .fill(Color.secondColorLight)
                        .frame(width: 350,height: 60)
                        .cornerRadius(20)
                        .offset(y: 40)
                        .padding()
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 100,height: 10)
                        .cornerRadius(20)
                        .offset(y:30)
                        .padding()
                }.cornerRadius(10).padding(-34)
            })
        }
    }
}

struct MonumentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentDetailView(image:"barrancoframe", name: "Vista de Prueba", distance: 2.5)
    }
}
