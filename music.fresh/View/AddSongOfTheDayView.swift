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
    @State private var url: String = ""
    @State private var year: String = ""
    @State private var description: String = ""
    
    @State private var showingAlert = false
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading) {
                
                ZStack {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .leading)
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }

                
                Form{
                    Section{
                        TextField("Nom", text: $name)
                            .textContentType(.name)
                            .disableAutocorrection(true)
                        TextField("Titre", text: $title)
                            .disableAutocorrection(true)
                    }
                    Section{
                        TextField("URL", text: $url)
                            .autocapitalization(.none)
                            .textContentType(.URL)
                            .disableAutocorrection(true)
                        TextField("Année", text: $year)
                            .textContentType(.telephoneNumber)
                            .keyboardType(.numberPad)
                    }
                    Section{
                        TextField("Desciption", text: $description)
                    }
                    
                }
                
                
                HStack {
                    Button("Annuler"){
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                    Button("Valider"){
                        showingAlert = true
                        presentationMode.wrappedValue.dismiss()
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Ajout effectué."))
                            }
                }
                .font(.title2)
                
            }
            .padding()
            .navigationTitle("Nouvelle musique")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddSongOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        AddSongOfTheDayView()
    }
}
