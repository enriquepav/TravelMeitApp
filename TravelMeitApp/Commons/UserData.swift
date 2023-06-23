//
//  UserData.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 13/06/23.
//

import Foundation

class UserData: ObservableObject {
    @Published var user: User? {
        didSet {
            // Guardar el usuario en UserDefaults cada vez que se actualiza
            if let encodedUser = try? JSONEncoder().encode(user) {
                UserDefaults.standard.set(encodedUser, forKey: "user")
            }
        }
    }
    
    init() {
        // Obtener el usuario guardado de UserDefaults al iniciar la aplicación
        if let savedUser = UserDefaults.standard.data(forKey: "user"),
           let decodedUser = try? JSONDecoder().decode(User.self, from: savedUser) {
            self.user = decodedUser
        }else{
            let newUser = User(name: "Prueba", mail: "mail@gmail.com", emergencyData: "emergencyData", selectedCountry: "selectedCountry", selectedLanguage: "selectedLanguage", selectedDate:"selectedDate", sizeType: "sizeType", selectedOptionIDs: ["A","B","C","D"]) // Ejemplo: reemplaza con los datos del formulario
            self.user = newUser
        }
    }
}
