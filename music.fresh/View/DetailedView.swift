//
//  DetailedView.swift
//  music.fresh
//
//  Created by dylan on 12/06/2021.
//

import SwiftUI

struct DetailedView: View {
    var artist: Artist
    
    var songs: [Song] {
        songsList.filter { song in
            // ca aurait du etre id, mais comme on genere un nouvelle uuid a chaque instance ca ne fonctionne pas :(
            return song.artist.name == artist.name
        }
    }

    var body: some View {
        NavigationView {
            
        }
        .overlay(
            VStack {
                Image(artist.imageName)
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        VStack {
                            Spacer()
                            HStack {
                                Text(artist.name).bold()
                                    .foregroundColor(.white)
                                    .font(.system(size:50, weight: .bold))
                                
                                Spacer()
                            }
                            .padding(5)
                        }
                    )
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Biographie").bold()
                                .foregroundColor(.gray)
                                .padding(.leading)
                                .font(.title2)
                            
                            Text(artist.description).padding([.horizontal, .top, .bottom], 15)
                                .font(.callout)
                        }.padding()
                        
                        VStack(alignment: .leading) {
                            Text("Titres").bold()
                                .foregroundColor(.gray)
                                .padding(.leading)
                                .font(.title2)
                            
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                HStack(spacing: 20) {
                                    ForEach(songs, id: \.id, content: { song in
                                        Image(song.imageName)
                                            .resizable()
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .overlay(
                                                NavigationLink(
                                                    destination: Text("Player"),
                                                    label: {
                                                        Image(systemName: "play")
                                                            .font(.system(size: 35, weight: .semibold))
                                                            .foregroundColor(.white)
                                                    })
                                            )
                                    })
                                }
                            }).padding()
                        }
                        
                        Spacer()
                    }
                })
            })
        .edgesIgnoringSafeArea(.top)
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(artist: artist1)
    }
}
