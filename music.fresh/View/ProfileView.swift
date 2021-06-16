//
//  ProfileView.swift
//  music.fresh
//
//  Created by lucie on 16/06/2021.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var userName: String = ""
    @State var email: String = ""
    @State var imageName: String = ""
    @State var termsAccepted = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Nom d'utilisateur", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Adresse e-mail", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if self.isUserInformationValid() {
                    Button(action: {
                        print("Updated profile")
                    }, label: {
                        Text("Update Profile")
                    })
                }
                
                Section {
                    Toggle(isOn: $termsAccepted,
                           label: {
                            Text("Accepter les conditions")
                           })
                    Button("valider") {
                        presentationMode.wrappedValue.dismiss()
                        let user = createUser()
                        print(user)
                    }
                }
            }
            .navigationBarTitle("Créer mon profil")
        }
    }
    
    func createUser() -> User {
        return User(name: userName, email: email, imageName: imageName)
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


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
