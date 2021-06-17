//
//  NewPlaylistView.swift
//  music.fresh
//
//  Created by mac32 on 16/06/2021.
//

import SwiftUI

struct NewPlaylistView: View {
    @State var playlistName = ""
    @State var playlistDescription = ""
    
    var body: some View {
        VStack{
            Image("imagePlaylist")
                .resizable()
                .frame(width: 250, height: 250)
                .cornerRadius(15)
                .opacity(0.2)
                .overlay(
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "camera.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 80, height: 80)
                            .foregroundColor(Color.yellow)
                    })
                )
                .padding()
            Form{
                Section(content: {
                    TextField("Nom de la playlist", text: $playlistName)
                    TextField("Description de la playlist", text: $playlistDescription)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack{
                            Image(systemName: "plus.circle.fill")
                            Text("Ajouter un titre")
                        }
                        .foregroundColor(Color.yellow)
                    })
                })
                .padding(8)
            }
            Spacer()
        }
    }
}

struct NewPlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlaylistView()
    }
}
