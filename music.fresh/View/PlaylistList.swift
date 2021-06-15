//
//  PlaylistList.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import SwiftUI

struct PlaylistList: View {
    let playlists: [Playlist]
    var body: some View {
        HStack{
            List(playlists) { playlist in
                Image(playlist.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                VStack(alignment: .leading){
                Text(playlist.title)
                    .font(.title3)
                Text(playlist.user)
                    .foregroundColor(.secondary)
                }
                Spacer()
                Button(action: {
                }, label: {
                    Image(systemName: "greaterthan")
                        .foregroundColor(.gray)
                })
            }
        }
    }
}

struct PlaylistList_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistList(playlists: playlistsList)
    }
}
