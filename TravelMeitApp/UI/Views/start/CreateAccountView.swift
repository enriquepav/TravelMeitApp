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

    struct Option: Identifiable {
        let id: String
        let icon: String
        var isSelected = false
    }
    
    @State private var options = [
        Option(id: "A", icon: "ic_historical"),
        Option(id: "B", icon: "ic_party"),
        Option(id: "C", icon: "ic_landscape"),
        Option(id: "D", icon: "ic_artist")
    ]
    @State private var selectedOptionIDs: Set<String> = []
    @State private var showAlert = false
    @State private var navigateToNextView = false
    @ObservedObject var appSettings = AppSettings()
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
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
                                Text("Create your account")
                                    .font(.title)
                                    .foregroundColor(.principalColor).padding(10)
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
                            
                            ScrollView(.horizontal) {
                                LazyHGrid(rows: [GridItem(.fixed(50))], spacing: 10) {
                                    ForEach(options) { option in
                                        Button(action: {
                                            toggleSelection(option)
                                            print(selectedOptionIDs)
                                        }) {
                                            Image(option.isSelected ? "\(option.icon).fill" : option.icon)
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                                .colorMultiply(Color.white.opacity(0.9))
                                                .padding(8)
                                           

                                        }
                                    }
                                }
                                .padding()
                            }
                            Button(action: {
                                showAlert = true
                            }) {
                                Text("Continue")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.thirdColor)
                                    .cornerRadius(30)
                            }
                            .padding()
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Estamos creando tu usuario..."),
                                    message: Text("¿Deseas continuar?"),
                                    primaryButton: .default(Text("Sí"), action: {
                                        appSettings.isUserCreated = true
                                        let formatter3 = DateFormatter()
                                        formatter3.dateFormat = "HH:mm E, d MMM y"
                                        print(formatter3.string(from: selectedDate))
                                        
                                        let newUser = User(name: name, mail: mail, emergencyData: emergencyData, selectedCountry: selectedCountry, selectedLanguage: selectedLanguage, selectedDate: formatter3.string(from: selectedDate), sizeType: sizeType, selectedOptionIDs: selectedOptionIDs) // Ejemplo: reemplaza con los datos del formulario
                                        userData.user = newUser
                                        print(userData.user?.name)
                                        navigateToNextView = true
                                    }),
                                    secondaryButton: .cancel()
                                )
                            }
                            
                            NavigationLink(
                                destination: MonumentsListView(),
                                isActive: $navigateToNextView
                            ) {
                                EmptyView()
                            }
                            .hidden()
                            
                        }
                    }.background(Color.white.opacity(0.7)).cornerRadius(20).padding(EdgeInsets(top: 20, leading: 80, bottom: 10, trailing: 80))
                }
            }
        }
        
        
    }
    
    func toggleSelection(_ option: Option) {
        if selectedOptionIDs.contains(option.id) {
                selectedOptionIDs.remove(option.id)
            } else {
                selectedOptionIDs.insert(option.id)
            }
            options = options.map { var updatedOption = $0; updatedOption.isSelected = selectedOptionIDs.contains(updatedOption.id); return updatedOption }
    }
    
}


struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
