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
    let countrys = ["Perú", "Estonia", "Francia"]
    @State private var selectedLanguage : String = ""
    let languages = ["Español", "Inglés"]
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
                    ScrollView {
                        ZStack {
                            Image("bg_title_cell")
                                .resizable()
                                .foregroundColor(.principalColor)
                                .frame(maxWidth: 400)
                                .edgesIgnoringSafeArea(.all)
                            
                            Image("logoTravelmeit")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .scaledToFit()
                                .frame(width: 220, height: 100)
                        }
                        
                        VStack {
                            
                            VStack(spacing:12) {
                                Text("Create your account")
                                    .font(.custom("fontastique", size: 25))
                                    .foregroundColor(.principalColor).padding(5)
                                TextField("Name", text: $name)
                                    .padding()
                                    .frame(maxWidth: 350, maxHeight: 40)
                                    .background(Color.white.opacity(0.7))
                                    .cornerRadius(150)
                                    .font(.custom("quicksand", size: 17)).foregroundColor(Color.gray)
                                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                    .shadow(color: Color.gray, radius: 3, x: 7, y: 3)
                                
                                HStack{
                                    Text("Country of origin").font(.custom("quicksand", size: 17)).foregroundColor(Color.gray)
                                    Spacer()
                                    Picker("", selection: $selectedCountry,
                                           content: {
                                        ForEach(countrys, id: \.self) { index in
                                            Text(index).tag(index)
                                        }
                                    }).pickerStyle(.menu)
                                }
                                .padding()
                                .frame(maxWidth: 350, maxHeight: 40)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(150)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                .shadow(color: Color.gray, radius: 3, x: 7, y: 3)
                                
                                HStack{
                                    Text("Language:").font(.custom("quicksand", size: 17)).foregroundColor(Color.gray)
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
                                .frame(maxWidth: 350, maxHeight: 40)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(150)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                .shadow(color: Color.gray, radius: 3, x: 7, y: 3)
                                
                                
                                DatePicker("Date of birth -\n dd/mm/aaaa", selection: $selectedDate, displayedComponents: .date)
                                    .padding()
                                    .frame(maxWidth: 350, maxHeight: 40)
                                    .background(Color.white.opacity(0.7))
                                    .cornerRadius(150)
                                    .font(.custom("quicksand", size: 17)).foregroundColor(Color.gray)
                                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                    .foregroundColor(Color.gray)
                                    .shadow(color: Color.gray, radius: 3, x: 7, y: 3)
                                
                                TextField("Email", text: $mail)
                                    .padding()
                                    .frame(maxWidth: 350, maxHeight: 40)
                                    .background(Color.white.opacity(0.7))
                                    .cornerRadius(150)
                                    .font(.custom("quicksand", size: 17)).foregroundColor(Color.gray)
                                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                    .shadow(color: Color.gray, radius: 3, x: 7, y: 3)
                                
                                TextField("Emergency number and/or email", text: $emergencyData)
                                    .padding()
                                    .frame(maxWidth: 350, maxHeight: 40)
                                    .background(Color.white.opacity(0.7))
                                    .cornerRadius(150)
                                    .font(.custom("quicksand", size: 17)).foregroundColor(Color.gray)
                                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                    .shadow(color: Color.gray, radius: 3, x: 7, y: 3)
                                
                                HStack{
                                    Text("Set distance measurement:").font(.custom("quicksand", size: 17)).foregroundColor(Color.gray)
                                    Picker("", selection: $sizeType,
                                           content: {
                                        ForEach(sizes, id: \.self) { index in
                                            Text(index)
                                                .tag(index)
                                        }
                                    }).pickerStyle(.menu)
                                }
                                .padding()
                                .frame(maxWidth: 350, maxHeight: 40)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(150)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                .shadow(color: Color.gray, radius: 3, x: 7, y: 3)
                                
                                Text("Type of traveler").font(.custom("fontastique", size: 20))                            .foregroundColor(.principalColor).padding(10)
                                Text("Select one or more options").foregroundColor(Color.gray).font(.custom("quicksand", size: 15))
                                
                            }
                            ScrollView(.horizontal) {
                                LazyHGrid(rows: [GridItem(.fixed(50))], spacing: 2) {
                                    ForEach(options) { option in
                                        Button(action: {
                                            toggleSelection(option)
                                            print(selectedOptionIDs)
                                        }) {
                                            Image(option.isSelected ? "\(option.icon).fill" : option.icon)
                                                .resizable()
                                                .frame(width: 80, height: 80)
                                                .colorMultiply(Color.white.opacity(0.9))
                                                .padding(2)
                                           

                                        }
                                    }
                                }
                                .padding()
                            }
                            Button(action: {
                                showAlert = true
                            }) {
                                Image("continueButton")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 220, height: 100)
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
                    }.background(Color.white.opacity(0.75)).cornerRadius(20).padding(EdgeInsets(top: 10, leading: 80, bottom: 10, trailing: 80))
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
