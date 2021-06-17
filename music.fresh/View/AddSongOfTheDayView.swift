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
    
    var body: some View {
        
        NavigationView{
            
            VStack(alignment: .leading) {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .leading)
                
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
                
                
                //            Button(action: {
                //                UserDefaults.standard.setValue(self.$name, forKey: "Nom")
                //                self.nameRetreived = self.name
                //                self.name = ""
                //            }, label: {
                //                Text("Valider")
                //                    .padding()
                //
                //            })
                
                
                //            HStack {
                //                Text("Nom :")
                //                TextField("Nom", text: $song.artist)
                //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //            }
                //            HStack {
                //                Text("Titre :")
                //                TextField("Titre", text: $song.title)
                //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //            }
                //            HStack {
                //                Text("URL :")
                //                TextField("URL", text: $song.url)
                //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //            }
                //            HStack{
                //                Text("Année :")
                //                TextField("Année", text: $song.year)
                //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //            }
                //            HStack {
                //                Text("Biographie :")
                //                TextField("", text: $song.description)
                //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                //            }
                
                HStack {
                    Button("Annuler"){
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                    Button("Valider"){
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .font(.largeTitle)
                
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
