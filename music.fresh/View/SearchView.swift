//
//  SearchView.swift
//  music.fresh
//
//  Created by mac32 on 15/06/2021.
//

import SwiftUI

struct SearchView: View {
    @Namespace var animation
    
    @State private var selection = 0
    @State var currentTab = "Titres"
    @State private var showModal = false
    @State var annuler = false

    @State var text = ""

    var body: some View {
        NavigationView{
            VStack{
                SearchBar(text: $text)
                    .padding(.bottom, 20)
                ScrollView(.vertical, showsIndicators: false){
                    SongList(songs: songsList)
                    PlaylistList(playlists: playlistsList)
                    ArtistList(artists: artistsList)
                }

            .navigationBarTitle("Rechercher")
            .navigationBarItems(trailing: Button(action: {
                                        showModal.toggle()
                                    }, label: {
                                        Image(systemName: "plus")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(Color.yellow)
                                    })).sheet(isPresented: $showModal) {
                                        if currentTab == "Playlists" {
                                            NewPlaylistView(showModal: $showModal)
                                        }
                                        
                                        if currentTab == "Titres" {
                                            NewSongFormView(showModal: $showModal)

                                        }
                                        if currentTab == "Artistes" {
                                            NewArtistFormView(showModal: $showModal)
                                        }
                                    }
            }
        }
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
