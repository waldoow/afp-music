//
//  ArtistList.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import SwiftUI

struct ArtistList: View {
    let artists: [Artist]
    var body: some View {
        HStack{
            List(artists) { artist in
                Image(artist.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .clipped()
                VStack(alignment: .leading){
                    Text(artist.name)
                        .font(.title3)
                    Text("Artiste")
                        .foregroundColor(.secondary)
                }
                Spacer()
                Button(action: {
                }, label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                })
            }
        }
    }
}

struct ArtistList_Previews: PreviewProvider {
    static var previews: some View {
        ArtistList(artists: artistsList)
    }
}
