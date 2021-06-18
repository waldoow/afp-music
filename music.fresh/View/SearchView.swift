//
//  SearchView.swift
//  music.fresh
//
//  Created by mac32 on 15/06/2021.
//

import SwiftUI

struct SearchView: View {
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
            }.navigationBarTitle("Rechercher")
        }
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
