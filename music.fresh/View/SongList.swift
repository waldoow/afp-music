//
//  SongList.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import SwiftUI

struct SongList: View {
    let songs: [Song]
    @State var text = ""
    @State private var showModalAddToPlaylist = false

    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(songs.filter({"\($0)".contains(text.lowercased()) || text.isEmpty })) { song in
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
            }
        }.padding(15)
    }
}
