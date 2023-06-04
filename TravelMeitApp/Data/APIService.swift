//
//  APIService.swift
//  TravelMeitApp
//
//  Created by Katherine Caillahua Castillo on 29/05/23.
//

import Foundation

class APIService :  ObservableObject {
    
    private let sourcesURL = URL(string: "https://api.jsonbin.io/v3/b/6474fd029d312622a3677e3a/")!
    
    /*func apiToGetMonumentsData(completion : @escaping ([MonumentData]) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(Monuments.self, from: data)
                completion(empData.record)
            }
        }.resume()
    }*/
    
    func apiToGetMonumentsData(completion : @escaping ([MonumentData]) -> ()){
        let decoder = JSONDecoder()
        do {
            let empData = try decoder.decode(Monuments.self, from: monumentsData)
            completion(empData.record)
        } catch {
            print(String(describing: error))
        }
    }
}
