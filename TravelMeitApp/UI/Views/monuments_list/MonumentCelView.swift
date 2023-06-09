//
//  MonumentCelView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 25/05/23.
//

import SwiftUI


struct MonumentCelView: View {
    
    @Binding var isCheckboxChecked: Bool
    @State var monumentImage: String
    @State var distance: Float
    @State var title: String
    @State var typeLong: String = "km."
    
    
    var body: some View {
        VStack {
            ZStack {
                /*AsyncImage(url: URL(string: monumentImage)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .imageScale(.large)
                        .frame(width: 300, height: 300)
                } placeholder: {
                    ProgressView()
                }*/
                //a revisar si es funcional o no
                CachedAsyncImage(url: URL(string: monumentImage)!, placeholder: Image("barrancoframe"))
                            .frame(width: 300, height: 300)
                
                VStack {
                    Text(title)
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
//                        Checkbox(isChecked: $isCheckboxChecked)
                        
                    }
                }
            }
        }
        .frame(width: 90, height: 10)
    }
}



struct MonumentCelView_Previews: PreviewProvider {
    static var previews: some View {
        MonumentCelView(isCheckboxChecked: Binding.constant(false), monumentImage: "https://www.wagnerproducciones.com/travelmeit/monumentos/APP%20IMG__PUENTE%20DE%20LOS%20SUSPIROS%202.jpg", distance: 0.20444, title: "Plaza de barranco")
    }
}
