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
    @State private var url: String = ""
    
    
    @State private var showingAlert = false
    
    @State private var isShowPhotoLibrary = false
    
    @Binding var annuler: Bool
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading) {
                                
                Form{
                    Section{
                        TextField("Artiste", text: $name)
                            .textContentType(.name)
                            .disableAutocorrection(true)
                        TextField("Titre", text: $title)
                            .disableAutocorrection(true)
                    }
                    Section{
                        TextField("Commentaires", text: $comments)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    Section{
                        TextField("URL", text: $url)
                            .autocapitalization(.none)
                            .textContentType(.URL)
                            .disableAutocorrection(true)
                    }
                }
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

