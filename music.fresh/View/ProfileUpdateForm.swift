//
//  ProfileView.swift
//  music.fresh
//
//  Created by lucie on 16/06/2021.
//

import SwiftUI

struct ProfileUpdateForm: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var retrieved = ""
    
    @State private var userName: String = ""
    @State private var email: String = ""
    @State private var imageName: String = ""
    @State private var password: String = ""
    @State private var confirmPassword = ""
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    Image(uiImage: self.image)
                        .resizable()
                        .frame(width: 250, height: 250)
                        .cornerRadius(15)
                        .opacity(0.2)
                        .clipped()
                        .overlay(
                            Button(action: {
                                //affiche la modal pour choisir une image
                                self.isShowPhotoLibrary = true
                            }, label: {
                                Image(systemName: "person.crop.circle.badge.plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(Color.yellow)
                            })
                        )
                        
                        .sheet(isPresented: $isShowPhotoLibrary) {
                            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                        }
                    Text(retrieved).fontWeight(.heavy)
                    TextField("nom d'utilisateur", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    TextField("adresse e-mail", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 20)
                        .textContentType(.emailAddress)
                    
                    SecureField("Mot de passe", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.password)
                    SecureField("confirmer mot de passe", text: $confirmPassword)
                        .textContentType(.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.bottom, 20)
                }
                Spacer()
                Spacer()
                Section {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        createUser()
                        
                        UserDefaults.standard.set(self.userName, forKey: "nom d'utilisateur")
                        self.retrieved = self.userName
                        self.userName = ""
                        
                        UserDefaults.standard.set(self.email, forKey: "adresse e-mail")
                        self.retrieved = self.email
                        self.email = ""
                    }) {
                        Text("Valider").padding(5)
                            .frame(alignment: .leading)
                    }
                    .frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(1)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(9)
                }
                .edgesIgnoringSafeArea(.bottom)

            }
            .navigationBarTitle("Créer mon profil")
        }
        .onAppear {
            // this will perform whenever this appears on the screen
            // like viewDidLoad() in UIKit
            guard let retrievedmsg = UserDefaults.standard.value(forKey: "Nom d'utilisateur") else{return}
            self.retrieved = retrievedmsg as! String
        }
    }
    
    func createUser() {
        let newUser = User(name: userName, email: email, imageName: imageName, password: password, recentSongs:[], myPlaylists: [])
        usersList.append(newUser)
        currentUser = newUser
    }
    
    func isUserInformationValid() -> Bool {
        if userName.isEmpty {
            return false
        }
        if email.isEmpty {
            return false
        }
        return true
    }
}

struct ProfileUpdateForm_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUpdateForm()
    }
}
