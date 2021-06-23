//
//  AddSongOfTheDayView.swift
//  music.fresh
//
//  Created by SPGJ on 16/06/2021.
//

import SwiftUI

struct AddSongOfTheDayView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var title: String = ""
    @State private var comments: String = ""

    
    @State private var showingAlert = false

    @State private var isShowPhotoLibrary = false
    
    @Binding var annuler: Bool
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading) {
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
                    }
                }
                // Debut
//                                HStack {
//                                    Button("Annuler"){
//                                        presentationMode.wrappedValue.dismiss()
//                                    }
//                                    Spacer()
//                                    Button("Valider"){
//
//                                        showingAlert = true
//                                    }
//                                    .alert(isPresented: $annuler) {
//                                        Alert(title: Text("Ajout effectué."), message: Text("Vous pouvez fermer."), dismissButton: .default(Text("Fermer"), action:{
//                                            presentationMode.wrappedValue.dismiss()
//                                        } ))
//                                    }
//                                }
//                                .font(.title2)
                // Fin
            }
            .padding()
            .navigationBarTitle(Text("Nouvelle musique"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
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

