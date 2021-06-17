//
//  NewPlaylistView.swift
//  music.fresh
//
//  Created by mac32 on 16/06/2021.
//

import SwiftUI

struct NewPlaylistView: View {
    @State var playlistName = ""
    @Binding var showModal: Bool
    var body: some View {
        NavigationView{
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
            }.navigationBarTitle(Text("Nouvelle playlist"), displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.showModal.toggle()
                                    }, label: {
                                        Text("Annuler")
                                            .foregroundColor(.yellow)
                                    })
                                ,
                                trailing:
                                    Button(action: {
                                        //action création de playlist
                                    }, label: {
                                        Text("Créer")
                                            .foregroundColor(Color.yellow)
                                    }))
        }
    }
    func createNewPlaylist() -> Playlist {
        return Playlist(title: playlistName, user: "test", imageName: "test", year: 2021, songs: songsList)
    }
}
