//
//  VistaPruebas.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI

struct VistaPruebas: View {
    @ObservedObject var viewModel = MonumentsListViewModel.shared

    
    var body: some View {
                VStack {
                    Spacer(minLength: 150)
                    ForEach(viewModel.monumentsData, id: \.monument) { item in
                        NavigationLink(destination: CreateAccountView()) {
                        Text(item.monument)
                        }
                    }
                    
                    .padding()
                }
        .navigationBarBackButtonHidden(true)
    }
}
struct VistaPruebas_Previews: PreviewProvider {
    static var previews: some View {
        VistaPruebas()
    }
}
