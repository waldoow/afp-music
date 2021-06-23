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
                //                VStack(spacing: 0) {
                //                    HStack(spacing: 0) {
                //                        Spacer()
                //                        Image(playlist.songs.indices.contains(0) ? playlist.songs[0].imageName : "defaultImageSong")
                //                            .resizable()
                //                            .frame(width: 80, height: 80, alignment: .center)
                //                        Image(playlist.songs.indices.contains(1) ? playlist.songs[1].imageName : "defaultImageSong")
                //                            .resizable()
                //                            .frame(width: 80, height: 80, alignment: .center)
                //                        Spacer()
                //                    }
                //                }
                Image(uiImage: playlist.imageName!)
                    .resizable()
                    .frame(width: 250, height: 250, alignment: .center)
                
                
                //                    HStack(spacing: 0) {
                //                        Spacer()
                //                        Image(playlist.songs.indices.contains(0) ? playlist.songs[0].imageName : "defaultImageSong")
                //                            .resizable()
                //                            .frame(width: 80, height: 80, alignment: .center)
                //                        Image(playlist.songs.indices.contains(1) ? playlist.songs[1].imageName : "defaultImageSong")
                //                            .resizable()
                //                            .frame(width: 80, height: 80, alignment: .center)
                //                        Spacer()
                //                    }
                //                }
                
                HStack{
                    VStack(alignment: .leading) {
                        Text(playlist.title)
                            .font(.title2)
                        Text(String(playlist.year))
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "play.circle")
                        .font(.system(size: 40))
                        .foregroundColor(.yellow)
                }
                .padding(10)
                
                List(playlist.songs, id: \.id) { song in
                    HStack {
                        Image(song.imageName)
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .center)
                        
                        VStack(alignment: .leading) {
                            Text(song.title)
                            Text(song.artist.name)
                                .font(.system(size: 15))
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "minus.circle")
                            .foregroundColor(.red)
                    }
                }.listStyle(PlainListStyle())
                
                Spacer()
            }
            .navigationBarItems(trailing: Button(action: {
                print()
            }, label: {
                Text("Modifier")
                    .foregroundColor(.yellow)
            }))
        }
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView(playlist: playlist1)
    }
}


