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
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                    ZStack (alignment: .top){
                        Color.white // Color de fondo para el área del margen
                            .edgesIgnoringSafeArea(.all)
                        
                        Image("barrancoframe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 3)
                            .cornerRadius(40)
                        
                        VStack {
                            Spacer()
    //                        HStack {
    //                            Image(systemName: "chevron.left")
    //                                .foregroundColor(.white)
    //                                .font(.system(size: 24, weight: .bold))
    //
    //                            Spacer()
    //                                .frame(width: 300)
    //
    //                            Image(systemName: "ellipsis")
    //                                .foregroundColor(.white)
    //                                .font(.system(size: 24, weight: .bold))
    //                                .rotationEffect(Angle(degrees: 90))
    //                        }
                            VStack(alignment: .trailing, spacing: 0) {
                                HStack {
                                    Button(action: {
                                                isChecked.toggle()
                                            }) {
                                                HStack {
                                                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                                        .foregroundColor(isChecked ? .blue : .gray)
                                                        .imageScale(.large)
                                                    
                                                    Text("")
                                                }
                                        }
                                    Text("NameOfPlace").padding()
                                }
                                .background(Color.blue)
                                .shadow(color: Color.gray, radius: 4, x: 0, y: 2)
                                
                                HStack {
                                    Image(systemName: "globe")
                                        .imageScale(.large)
                                        .foregroundColor(.accentColor)
                                    Text("Hello, world!")
                                    
                                }
                                .background(Color.orange)
                                Spacer().frame(height:430)
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
                            }
                            
                        }
                        
                       
                    }
                }
            }
        }
}
    
struct MonumentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentDetailView()
    }
}
