//
//  SongList.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import SwiftUI

struct SongList: View {
    let songs: [Song]
    var body: some View {
        HStack{
            List(songs) { song in
                Image(song.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                VStack(alignment: .leading){
                Text(song.title)
                    .font(.title3)
                Text(song.artist)
                    .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList(songs: songsList)
    }
}
