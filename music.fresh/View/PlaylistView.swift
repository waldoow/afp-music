//
//  PlaylistView.swift
//  music.fresh
//
//  Created by A_W on 16/06/2021.
//

import SwiftUI

struct PlaylistView: View {
    var playlist: Playlist

    var body: some View {
        VStack {
            VStack {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Spacer()
                        Image(playlist.songs.indices.contains(0) ? playlist.songs[0].imageName : "defaultImageSong")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Image(playlist.songs.indices.contains(1) ? playlist.songs[1].imageName : "defaultImageSong")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Spacer()
                    }

                    HStack(spacing: 0) {
                        Spacer()
                        Image(playlist.songs.indices.contains(0) ? playlist.songs[0].imageName : "defaultImageSong")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Image(playlist.songs.indices.contains(1) ? playlist.songs[1].imageName : "defaultImageSong")
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Spacer()
                    }
                }
                
                HStack() {
                    VStack {
                        Text(playlist.title)
                            .font(.title2)
                        Text(String(playlist.year))
                    }
                    
                    Spacer()
                    
                    Image(systemName: "play.circle")
                        .font(.system(size: 40))
                        .foregroundColor(.yellow)
                }
                .padding()
                
                List(playlist.songs, id: \.id) { song in
                    HStack {
                        Image(song.imageName)
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .center)
                        
                        HStack {
                            Text(song.title)
                            Text(song.artist.name)
                        }

                        Spacer()
                        
                        Image(systemName: "ellipsis")
                    }
                }.listStyle(PlainListStyle())
                
                Spacer()
            }
            .navigationTitle(playlist.title)
            .navigationBarItems(trailing: Button(action: {
                print()
            }, label: {
                Text("Modifier")
            }))
        }
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView(playlist: playlist1)
    }
}


