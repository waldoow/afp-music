//
//  SearchView.swift
//  music.fresh
//
//  Created by mac32 on 15/06/2021.
//

import SwiftUI

struct SearchView: View {
    @State private var selection = 0
    var body: some View {
        VStack{
            Picker("", selection: $selection) {
                Text("Titres").tag(0)
                Text("Playlists").tag(1)
                Text("Artistes").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
            if selection == 0 {
                SongList(songs: songsList)
            } else if selection == 1 {
                PlaylistList(playlists: playlistsList)
            } else if selection == 2 {
                ArtistList(artists: artistsList)
            }
            Spacer()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
