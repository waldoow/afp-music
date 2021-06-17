//
//  NewPlaylistView.swift
//  music.fresh
//
//  Created by mac32 on 16/06/2021.
//

import SwiftUI
import Foundation

struct NewPlaylistView: View {
    @State var playlistName = ""
    @Binding var showModal: Bool
    var year = Int(DateFormatter.displayDate.string(from: Date())) ?? 2021
    
    @State var retrieved = ""
    @State var showSongs = false
    var body: some View {
        NavigationView{
            VStack{
                Image("imagePlaylist")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(15)
                    .opacity(0.2)
                    .overlay(
                        Button(action: {
                            //affiche la modal pour choisir une image
                        }, label: {
                            Image(systemName: "camera.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color.yellow)
                        })
                    )
                    .padding(20)
                Form{
                    Section(content: {
                        TextField("Nom de la playlist", text: $playlistName)
                        Button(action: {
                            self.showSongs.toggle()
                        }, label: {
                            HStack{
                                Image(systemName: "plus.circle.fill")
                                Text("Ajouter un titre")
                            }
                            .foregroundColor(Color.yellow)
                        }).sheet(isPresented: $showSongs) {
                            SongList(songs: songsList)
                        }
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
                                        self.showModal.toggle()
                                        playlistsList.append(Playlist(title: playlistName, user: user1.name, imageName: playlist1.imageName, year: year, songs: []))
                                        UserDefaults.standard.set(self.playlistName, forKey: "PlaylistName")
                                        self.retrieved = self.playlistName
                                        self.playlistName = ""
                                    }, label: {
                                        Text("Créer")
                                            .foregroundColor(Color.yellow)
                                    }))
            .onAppear{
                guard let retrievedplaylist = UserDefaults.standard.value(forKey: "PlaylistName") else { return }
                
                self.retrieved = retrievedplaylist as! String
            }
        }
    }
}

extension DateFormatter {
    static let displayDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        return formatter
    }()
}
