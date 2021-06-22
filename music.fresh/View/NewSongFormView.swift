//
//  NewSongFormView.swift
//  music.fresh
//
//  Created by A_W on 21/06/2021.
//

import SwiftUI
import Foundation

struct NewSongFormView: View {
    @Binding var showModal: Bool
    
    @State var title: String = ""
    @State var artist: Artist?
    @State var description: String = ""
    @State var imageName: String = ""
    @State var url: String = ""
    @State var year: String = ""
    @State var pickerIndex: Artist?
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Titre", text: $title)
                }
                
                Button(action: {
                    self.isShowPhotoLibrary = true

                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
                .sheet(isPresented: $isShowPhotoLibrary) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }
                
                Section {
                    TextEditor(text: $description)
                }
                
                Section {
                    TextField("Annee", text: $year)
                }

//                    NavigationLink(
//                        destination: NewArtistFormView(),
//                        label: {
//                            Text("Ajouter un Artiste")
//                        })


                Section {
                    Picker(selection: $pickerIndex, label: Text("Artistes"), content: {
                        ForEach(artistsList, id: \.self) { artist in
                            HStack {
                                Text(artist.name)
                            }
                            .tag(artist as Artist?)
                        }
                    })
                }
                
                Section {
                    TextField("Url", text: $url)
                    TextField("Url", text: $url, onCommit: {})
                }
                
                Section {
                    TextField("iamge", text: $imageName)
                }
                
                Button(action: {
                    print(image)
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
}

struct NewSongFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewSongFormView(showModal: .constant(false))
    }
}
