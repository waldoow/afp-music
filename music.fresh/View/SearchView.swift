//
//  SearchView.swift
//  music.fresh
//
//  Created by mac32 on 15/06/2021.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    var body: some View {
        NavigationView{
            VStack{
                GlobalSearchView(songs: songsList, playlists: playlistsList, artists: artistsList, users: usersList)
            }.navigationBarTitle("Rechercher")
        }
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct GlobalSearchView: View {
    let songs: [Song]
    let playlists: [Playlist]
    let artists: [Artist]
    let users: [User]
    
    @State var text = ""
    @State private var showModalAddToPlaylist = false
    @State private var showModalCreatePlaylist = false
    var body: some View {
        VStack{
            SearchBar(text: $text)
            List {
                ForEach(songs.filter({"\($0)".contains(text.lowercased()) || text.isEmpty})) { song in
                    HStack{
                        Image(song.imageName)
                            .resizable()
                            .frame(width: 55, height: 55)
                        
                        VStack(alignment: .leading){
                            Text(song.title)
                                .font(.title3)
                            Text(song.artist.name)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Button(action: {
                            self.showModalAddToPlaylist.toggle()
                        }, label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 23, height: 23)
                                .foregroundColor(.yellow)
                        }).sheet(isPresented: $showModalAddToPlaylist) {
                            AddToPlaylist(showModalAddToPlaylist: $showModalAddToPlaylist)
                        }
                    }
                }
                ForEach(playlists.filter({"\($0)".contains(text.lowercased()) || text.isEmpty})) { playlist in
                    NavigationLink(
                        destination: PlaylistView(playlist: playlist),
                        label: {
                            HStack{
                                Image(uiImage: playlist.imageName!)
                                    .resizable()
                                    .frame(width: 55, height: 55)
                                    .clipped()
                                VStack(alignment: .leading){
                                    Text(playlist.title)
                                        .font(.title3)
                                    Text(playlist.user)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }).foregroundColor(.black)
                }
                ForEach(artists.filter({"\($0)".contains(text.lowercased()) || text.isEmpty})) { artist in
                    NavigationLink(
                        destination: DetailedView(artist: artist),
                        label: {
                            HStack{
                                Image(artist.imageName)
                                    .resizable()
                                    .frame(width: 55, height: 55)
                                    .clipped()
                                VStack(alignment: .leading) {
                                    Text(artist.name)
                                        .font(.title3)
                                    Text("Artiste")
                                        .foregroundColor(.secondary)
                                }
                            }
                        }).foregroundColor(.black)
                }
                ForEach(users.filter({"\($0)".contains(text.lowercased()) || text.isEmpty})) { user in
                    NavigationLink(
                        destination: UserView(user: user),
                        label: {
                            HStack{
                                Image(user.imageName ?? "")
                                    .resizable()
                                    .frame(width: 55, height: 55)
                                    .clipped()
                                VStack(alignment: .leading) {
                                    Text(user.name)
                                        .font(.title3)
                                    Text("Artiste")
                                        .foregroundColor(.secondary)
                                }
                            }
                        }).foregroundColor(.black)
                }

            }
            .listStyle(GroupedListStyle())
        }
    }
}
