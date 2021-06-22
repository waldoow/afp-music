//
//  NewArtistFormView.swift
//  music.fresh
//
//  Created by A_W on 21/06/2021.
//

import SwiftUI

struct NewArtistFormView: View {
    @Binding var showModal: Bool
    @State var name: String = ""
    @State var imageName = ""
    @State var description: String = ""

    var body: some View {
        Form {
            Section {
                TextField("Nom de l'artite", text: $name)
            }
            
            Section {
                TextField("Image", text: $imageName)
            }
            
            Section {
                TextEditor(text: $description)
            }
            
            Button(action: {
                artistsList.append(Artist(id: UUID(), name: name, imageName: imageName, description: description))
            }, label: {
                HStack {
                    Spacer()
                    Text("Enregistrer")
                    Spacer()
                }
            })
        }
        
    }
}

struct NewArtistFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewArtistFormView(showModal: .constant(false))
    }
}
