//
//  PlaylistView.swift
//  music.fresh
//
//  Created by A_W on 16/06/2021.
//

import SwiftUI

struct PlaylistView: View {
    var playlist: Playlist

    @EnvironmentObject var playlistSongs: PlayerSongs

    var body: some View {
        VStack {
            VStack {
                Image(uiImage: playlist.imageName!)
                    .resizable()
                    .frame(width: 250, height: 250, alignment: .center)
                
                HStack{
                    VStack(alignment: .leading) {
                        Text(playlist.title)
                            .font(.title2)
                        Text(String(playlist.year))
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()

                    Button(action: {
                        if playlistSongs.playing {
                            playlistSongs.pause()
                        } else {
                            playlistSongs.currentIndex = 0
                            playlistSongs.inLineSongs = playlist.songs
                            playlistSongs.prepare()
                            playlistSongs.play()
                        }
                    }, label: {
                        if !playlistSongs.playing {
                            Image(systemName: "play.circle")
                                .font(.system(size: 40))
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "pause.circle")
                                .font(.system(size: 40))
                                .foregroundColor(.yellow)
                        }
                    })

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


