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
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .leading)
            
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
            
            Button("revenir"){
                presentationMode.wrappedValue.dismiss()
            }
            
        }
        .padding()
    }
}

struct AddSongOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        AddSongOfTheDayView()
    }
}
