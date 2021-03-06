//
//  ArtistList.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import SwiftUI

struct ArtistList: View {
    let artists: [Artist]

    @State var text = ""

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(artists.filter({"\($0)".contains(text.lowercased()) || text.isEmpty })) { artist in
                NavigationLink(
                    destination: DetailedView(artist: artist),
                    label: {
                        HStack{
                            Image(artist.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 55, height: 55)
                                .clipped()
                            VStack(alignment: .leading) {
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
                    }).foregroundColor(.black)
            }
        }.padding(15)
    }
}

struct ArtistList_Previews: PreviewProvider {
    static var previews: some View {
        ArtistList(artists: artistsList)
    }
}
