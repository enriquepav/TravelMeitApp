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
    @State var showGoto = false
    @State private var didTap45:Bool = false
    @State private var didTap15:Bool = false
    @State private var didTap3:Bool = false

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
                            VStack {
                                Image("listen_to")
                                    .resizable()
                                    .frame(width: 170, height: 45)
                                Text("Choose the audio duration")
                                    .foregroundColor(Color.principalColor)
                                    .font(.system(size: 12).bold())
                                    .frame(width: 200, height: 20)
                                    .multilineTextAlignment(.center)
                                HStack{
                                    Button(action: {
                                        self.didTap45 = true
                                        self.didTap15 = false
                                        self.didTap3 = false
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
                                    }, label: {
                                        Text("3 min")
                                            .frame(width: 45, height: 8)
                                            .padding()
                                            .foregroundColor(didTap3 ? Color.white : Color.principalColor).font(.system(size: 13))
                                    }).background(didTap3 ? Color.thirdColor : Color.white).cornerRadius(10)
                                }
                                
                                HStack{
                                    Button(action: {}, label: {
                                        Image("btn_play")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .padding()
                                    })
                                    
                                    Button(action: {}, label: {
                                        Image("btn_stop")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .padding()
                                    })
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
                                    Button(action: {}, label: {
                                        Text("Yes")
                                            .frame(width: 100, height: 10)
                                            .padding()
                                            .background(Color.thirdColor)
                                            .cornerRadius(20)
                                            .foregroundColor(Color.white)
                                    })
                                    
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
            }
        }
    }
}

struct MonumentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentDetailView(image:"barrancoframe", name: "Vista de Prueba", distance: 2.5)
    }
}
