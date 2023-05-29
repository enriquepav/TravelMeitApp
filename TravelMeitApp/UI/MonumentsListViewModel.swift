//
//  MonumentsListViewModel.swift
//  TravelMeitApp
//
//  Created by Katherine Caillahua Castillo on 29/05/23.
//

import Foundation


final class MonumentsListViewModel: ObservableObject {
    private var apiService: APIService!
    @Published var monumentsData = [MonumentData]()

    init(){
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetMonumentsData { (monumentsData) in
               self.monumentsData = monumentsData
           }
       }

}
