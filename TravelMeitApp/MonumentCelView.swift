//
//  MonumentCelView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 25/05/23.
//

import SwiftUI

struct MonumentCelView: View {
    @State private var isChecked: Bool = false
    @State var monumentImage: String = "barrancoframe"
    @State var distance: Float
    @State var typeLong: String = "KM"
    
    
    var body: some View {
        VStack {
            ZStack {
                Image(monumentImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .imageScale(.large)
                            .frame(width: 300, height: 300)
                
                VStack {
                    Text("Plaza de barranco").foregroundColor(.white)
                    Spacer()
                    HStack {
                        HStack {
                            Image(systemName: "globe")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .imageScale(.large)
                                        .frame(width: 10, height: 10)
                            Text(String(format: "%.2f", distance)).foregroundColor(.white)
                            Text("\(typeLong)").foregroundColor(.white)
                        }
                        
                        Spacer().frame(width: 25)
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
                    }
                }
            }
        }
        .frame(width: 90, height: 10)
        

        
    }
}

struct MonumentCelView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentCelView(distance: 0.20)
    }
}
