//
//  PlacesView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 21/05/23.
//

import SwiftUI

struct PlacesView: View {
    
    @State private var isChecked: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                Image("barrancoImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .imageScale(.large)
                            .frame(width: 300, height: 300)
                VStack {
                    Text("Plaza de barranco")
                    Spacer()
                    HStack {
                        HStack {
                            Image(systemName: "globe")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .imageScale(.large)
                                        .frame(width: 10, height: 10)
                            Text("0.15 KM")
                            
                        }
                        Spacer()
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
        .frame(width: 200, height: 300)
        

        
    }
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView()
    }
}
