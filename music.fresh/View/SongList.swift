//
//  SongList.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import SwiftUI

struct SongList: View {
    
    let songs: [Song]
    @State private var showAlert = false
    @State var searchText = ""
    
    var body: some View {
        HStack{
            List(songs) { song in
                Image(song.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .clipped()
                VStack(alignment: .leading){
                    Text(song.title)
                        .font(.title3)
                    Text(song.artist.name)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Button(action: {
                    showAlert = true
                }, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 23, height: 23)
                        .foregroundColor(.yellow)
                }).alert(isPresented: $showAlert) {
                    Alert(title: Text("Titre ajouté aux favoris"), dismissButton: .default(Text("Ok")))
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList(songs: songsList)
    }
}
