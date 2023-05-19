//
//  CreateAccountView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 18/05/23.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State private var name: String = ""
    @State private var mail: String = ""
    @State private var emergencyData: String = ""
    @State private var selectedCountry : String = ""
    let countrys = ["Perú", "Brasil", "México"]
    @State private var selectedLanguage : String = ""
    let languages = ["Español", "Inglés", "Chino"]
    @State private var selectedDate = Date()
    @State private var sizeType : String = ""
    let sizes = ["Kilómetros y metros", "Millas y pies"]
    @State private var selectedOption: Int = 0 // Estado de selección
    let options = ["Aventurero", "Turista", "Gastronómico", "Mochilero", "De lujo"]
    

    
    var body: some View {
        VStack {
            Group {
                VStack {
                    Text("Crea tu cuenta")
                    TextField("Nombre", text: $name)
                        .padding()
                        .frame(maxWidth: 350)
                        .background(Color.gray.opacity(0.09))
                        .cornerRadius(150)
                        .padding()
                        .font(.body)
                        .shadow(color: Color.black.opacity(0.9), radius: 5, x: 10, y: 10)
                    
                    Picker("", selection: $selectedCountry,
                           content: {
                        Text("País de origen:")
                        ForEach(countrys, id: \.self) { index in
                            Text(index)
                                .tag(index)
                        }
                    }
                           
                    )
                    .padding()
                    .frame(maxWidth: 350)
                    .background(Color.gray.opacity(0.09))
                    .cornerRadius(150)
                    .font(.body)
                    .shadow(color: Color.black.opacity(0.9), radius: 5, x: 10, y: 10)
                    
                    Picker("", selection: $selectedLanguage,
                           content: {
                        Text("Idioma:")
                        ForEach(languages, id: \.self) { index in
                            Text(index)
                                .tag(index)
                        }
                    }
                           
                    )
                    .padding()
                    .frame(maxWidth: 350)
                    .background(Color.gray.opacity(0.09))
                    .cornerRadius(150)
                    .font(.body)
                    .shadow(color: Color.black.opacity(0.9), radius: 5, x: 10, y: 10)
                    
                    DatePicker("Fecha de nacimiento - dd/mm/aaaa", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.compact) // Estilo del DatePicker
                        .padding()
                        .frame(maxWidth: 350)
                        .background(Color.gray.opacity(0.09))
                        .cornerRadius(150)
                        .font(.body)
                        .shadow(color: Color.black.opacity(0.9), radius: 5, x: 10, y: 10)
                    
                    TextField("Correo", text: $mail)
                        .padding()
                        .frame(maxWidth: 350)
                        .background(Color.gray.opacity(0.09))
                        .cornerRadius(150)
                        .padding()
                        .font(.body)
                        .shadow(color: Color.black.opacity(0.9), radius: 5, x: 10, y: 10)
                    
                    TextField("Número y/o correo de emergencia", text: $emergencyData)
                        .padding()
                        .frame(maxWidth: 350)
                        .background(Color.gray.opacity(0.09))
                        .cornerRadius(150)
                        .padding()
                        .font(.body)
                        .shadow(color: Color.black.opacity(0.9), radius: 5, x: 10, y: 10)
                    
                    Picker("", selection: $sizeType,
                           content: {
                        Text("Fijar medida de distancia")
                        ForEach(sizes, id: \.self) { index in
                            Text(index)
                                .tag(index)
                        }
                    }
                           
                    )
                    .padding()
                    .frame(maxWidth: 350)
                    .background(Color.gray.opacity(0.09))
                    .cornerRadius(150)
                    .font(.body)
                    .shadow(color: Color.black.opacity(0.9), radius: 5, x: 10, y: 10)
                    
                }
            }
            
            
            Group {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(0..<options.count, id: \.self) { index in
                            Button(action: {
                                selectedOption = index // Actualizar el estado de selección al hacer clic en la opción
                            }) {
                                Text(options[index])
                                    .font(.title)
                                    .padding()
                                    .background(selectedOption == index ? Color.blue.opacity(0.5) : Color.clear) // Marcar la opción seleccionada
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                
            }
        }
    }
    
   
}


struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
