//
//  SongOfTheDayView.swift
//  music.fresh
//
//  Created by SPGJ on 14/06/2021.
//

import SwiftUI

struct SongOfTheDayView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack{
                
                NavigationLink(destination: AddSongOfTheDayView()){
                    
                }
                .navigationTitle("Chanson du jour")
                // bouton lien vers modale
                .navigationBarItems(trailing: Button("+") {
                    isPresented.toggle()
                }
                .fullScreenCover(isPresented: $isPresented, content: AddSongOfTheDayView.init)
                .font(.largeTitle)
                )
                
                //                Image(systemName: "plus.circle")
                //                    .foregroundColor(.blue)
                //                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Spacer()
                Text("Découvrez de la vraie nouveauté, peu connu, que vous ne trouvez pas sur les autres apps.")
                Spacer()
                Text("En attente de la AudioPlayerView")
                    .frame(maxWidth: .infinity, maxHeight:150)
                    .foregroundColor(.blue)
                    .background(Color.yellow)
                ZStack{
                    Image("user1.jpg")
                        .resizable()
                        .frame(maxWidth: .infinity)
                    //                    .aspectRatio(contentMode: .fit)
                    Text(artist1.name)
                        .foregroundColor(.white)
                        .offset(y: 60)
                }
                .frame(maxWidth: .infinity, maxHeight:150)
                
                ScrollView(.vertical){
                    
                    VStack{
                        // mettre tableau vote
                        VoteView(vote: vote1)
                            .frame(maxWidth: .infinity, maxHeight:150)
                        VoteView(vote: vote2)
                            .frame(maxWidth: .infinity, maxHeight:150)
                        VoteView(vote: vote3)
                            .frame(maxWidth: .infinity, maxHeight:150)
                        VoteView(vote: vote4)
                            .frame(maxWidth: .infinity, maxHeight:150)
                        VoteView(vote: vote5)
                            .frame(maxWidth: .infinity, maxHeight:150)
                    }
                }
            }
            .padding()
        }
        //        .edgesIgnoringSafeArea(.top)
    }
}


struct AddSongView: View{
    
//    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var title: String = ""
    @State private var url: String = ""
    @State private var year: String = ""
    @State private var description: String = ""
    
//    @State private var nameRetreived = ""
    
    
    var body: some View {
        
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
            
        }
        .padding()
    }
}

struct SongOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        SongOfTheDayView()
    }
}

