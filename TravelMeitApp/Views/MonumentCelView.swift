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
    @State var typeLong: String = "km."
    
    
    var body: some View {
        VStack {
            ZStack {
                Image(monumentImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .imageScale(.large)
                            .frame(width: 300, height: 300)
                VStack {
                    Text("Plaza de barranco")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold))
                        .padding(8)
                        .background(RoundedCorners(color: .principalColor, tl: 0, tr: 00, bl: 30, br:30))
                    Spacer()
                    HStack {
                        Label{
                            Text(String(format: "%.2f" + " " + typeLong, distance))
                                .foregroundColor(.white)
                                .font(.system(size: 10, weight: .bold))
                                .padding(3)
                        } icon: {
                            Image("ic_location")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 10)
                                .padding(5)
                        }
                        .background(
                            RoundedCorners(color: .thirdColor, tl: 3, tr: 3, bl: 3, br:3))
                        .padding(10)
                        Spacer().frame(width: 10)
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
