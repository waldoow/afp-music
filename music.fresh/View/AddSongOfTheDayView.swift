//
//  AddSongOfTheDayView.swift
//  music.fresh
//
//  Created by SPGJ on 16/06/2021.
//

import SwiftUI

struct AddSongOfTheDayView: View {
    
    //    @State var song: Song
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var title: String = ""
    @State private var comments: String = ""
    @State private var year: String = ""
    @State private var description: String = ""
    
    @State private var showingAlert = false
//    @State var showModal: Bool
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    @Binding var annuler: Bool
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading) {
                
//                ZStack {
//
//                    Image(uiImage: self.image)
//                        .resizable()
//                        .frame(width: 150, height: 150)
//                        .cornerRadius(15)
//                        .opacity(0.2)
//                        .clipped()
//                        .overlay(
//                            Button(action: {
//                                //affiche la modal pour choisir une image
//                                self.isShowPhotoLibrary = true
//                            }, label: {
//                                Image(systemName: "camera.circle.fill")
//                                    .resizable()
//                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                                    .frame(width: 80, height: 80)
//                            })
//                        )
//                        .padding(20)
//
//                        .sheet(isPresented: $isShowPhotoLibrary) {
//                            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
//                        }
//                }
                
                Form{
                    Section{
                        TextField("Artist", text: $name)
                            .textContentType(.name)
                            .disableAutocorrection(true)
                        TextField("Titre", text: $title)
                            .disableAutocorrection(true)
                    }
                    Section{
                        TextField("Commentaires", text: $comments)
                            .autocapitalization(.none)
                            .textContentType(.URL)
                            .disableAutocorrection(true)
//                        TextField("Année", text: $year)
//                            .textContentType(.telephoneNumber)
//                            .keyboardType(.numberPad)
                    }
//                    {Section{
//                        TextField("Description", text: $description)
//                    }}
                    
                }
                
//                HStack {
//                    Button("Annuler"){
//                        presentationMode.wrappedValue.dismiss()
//                    }
//                    Spacer()
//                    Button("Valider"){
//
//                        showingAlert = true
//                    }
//                    // ajouter condition si champs vide
//                    .alert(isPresented: $showingAlert) {
//                        Alert(title: Text("Ajout effectué."), message: Text("Vous pouvez fermer."), dismissButton: .default(Text("Fermer"), action:{
//                            presentationMode.wrappedValue.dismiss()
//                        } ))
//                    }
//                }
//                .font(.title2)
                
            }
            .padding()
            .navigationBarTitle(Text("Nouvelle musique"), displayMode: .inline)
            .navigationBarItems(leading:Button(action: {
                self.annuler.toggle()
            }, label: {
                Text("Annuler")
            }), trailing: Button(action: {
                self.annuler.toggle()
            }, label: {
                Text("Valider")
            }))
        }
    }
}

//struct AddSongOfTheDayView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddSongOfTheDayView(showModal: false)
//    }
//}

