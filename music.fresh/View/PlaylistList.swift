//
//  PlaylistList.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import SwiftUI

struct PlaylistList: View {
    let playlists: [Playlist]
    @State var text = ""
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(playlists.filter({"\($0)".contains(text.lowercased()) || text.isEmpty })) { playlist in
                NavigationLink(
                    destination: PlaylistView(playlist: playlist),
                    label: {
                        HStack {
                            Image(playlist.imageName)
                                .resizable()
                                .frame(width: 55, height: 55)
                                .clipped()

                            VStack(alignment: .leading){
                                Text(playlist.title)
                                    .font(.title3)
                                Text(playlist.user)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()

                            Button(action: {
                            }, label: {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            })
                        }
                    })

            }
        }.padding(15)
    }
}

struct PlaylistList_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistList(playlists: playlistsList)
    }
}
