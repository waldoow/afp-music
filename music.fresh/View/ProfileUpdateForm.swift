//
//  ProfileView.swift
//  music.fresh
//
//  Created by lucie on 16/06/2021.
//

import SwiftUI

struct ProfileUpdateForm: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var retrieved         = ""
    @State var userName: String  = ""
    @State var email: String     = ""
    @State var imageName: String = ""
    @State var password: String  = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("adresse e-mail", text: $email)
                        TextField("nom d'utilisateur", text: $userName)
                    }

                    Section {
                        TextField("url de ton image", text: $imageName)
                    }

                    Section {
                        TextField("mot de passe", text: $password)
                    }

                    if self.isUserInformationValid() {
                        Button(action: {
                            print("Updated profile")
                        }, label: {
                            Text("Update Profile")
                        })
                    }
                }

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                    createUser()
                    
                    UserDefaults.standard.set(self.userName, forKey: "nom d'utilisateur")
                    self.retrieved = self.userName
                    self.userName  = ""
                    
                    UserDefaults.standard.set(self.email, forKey: "adresse e-mail")
                    self.retrieved = self.email
                    self.email     = ""
                }) {
                    Text("Valider")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(10)
                        .padding(.horizontal, 100)
                }
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(9)
            }
            .navigationBarTitle(currentUser != nil ? currentUser!.name : "Créer mon profil")
        }
        .onAppear {
            // this will perform whenever this appears on the screen
            // like viewDidLoad() in UIKit
            guard let retrievedmsg = UserDefaults.standard.value(forKey: "Nom d'utilisateur") else{return}
            self.retrieved = retrievedmsg as! String
        }
    }
    
    func createUser() {
        let newUser = User(name: userName, email: email, imageName: imageName, recentSongs:[], myPlaylists: [])
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
