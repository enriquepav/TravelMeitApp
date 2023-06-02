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
        ZStack{
            Image("bg_start")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 3)
            
            VStack{
                Image("logoTravelmeit")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .padding()
                
                ScrollView {
                    
                    VStack {
                        
                        VStack {
                            Text("Create your account").font(.title)                            .foregroundColor(.principalColor).padding(10)
                            TextField("Name", text: $name)
                                .padding()
                                .frame(maxWidth: 350)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(150)
                                .font(.body)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            
                            HStack{
                                Text("Country of origin").foregroundColor(Color.gray)
                                Spacer()
                                Picker("", selection: $selectedCountry,
                                       content: {
                                    ForEach(countrys, id: \.self) { index in
                                        Text(index).tag(index)
                                    }
                                }).pickerStyle(.menu)
                            }
                            .padding()
                            .frame(maxWidth: 350)
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(150)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            
                            HStack{
                                Text("Language:").foregroundColor(Color.gray)
                                Spacer()
                                Picker("", selection: $selectedLanguage,
                                       content: {
                                    ForEach(languages, id: \.self) { index in
                                        Text(index)
                                            .tag(index)
                                    }
                                }).pickerStyle(.menu)
                            }
                            .padding()
                            .frame(maxWidth: 350)
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(150)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            
                            
                            DatePicker("Date of birth -\n dd/mm/aaaa", selection: $selectedDate, displayedComponents: .date)
                                .padding()
                                .frame(maxWidth: 350)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(150)
                                .font(.body)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                .foregroundColor(Color.gray)
                            
                            TextField("Email", text: $mail)
                                .padding()
                                .frame(maxWidth: 350)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(150)
                                .font(.body)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            
                            TextField("Emergency number and/or email", text: $emergencyData)
                                .padding()
                                .frame(maxWidth: 350)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(150)
                                .font(.body)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            
                            HStack{
                                Text("Set distance measurement:").foregroundColor(Color.gray)
                                Picker("", selection: $sizeType,
                                       content: {
                                    ForEach(sizes, id: \.self) { index in
                                        Text(index)
                                            .tag(index)
                                    }
                                }).pickerStyle(.menu)
                            }
                            .padding()
                            .frame(maxWidth: 350)
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(150)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            
                            Text("Type of traveler").font(.system(size: 25))                            .foregroundColor(.principalColor).padding(8)
                            Text("Select one or more options").foregroundColor(Color.gray).font(.system(size: 15))
                            
                        }
                        
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
                        }.padding(20)
                        
                        Button(action: {
                            // Acción a realizar cuando se presione el botón
                        }) {
                            Text("Continue")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.thirdColor)
                                .cornerRadius(30)
                        }
                        
                    }
                }.background(Color.white.opacity(0.7)).cornerRadius(20).padding(EdgeInsets(top: 20, leading: 80, bottom: 10, trailing: 80))
                
            }
            
            
        }
        
        
    }
    
    
}


struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
