//
//  DetailedView.swift
//  music.fresh
//
//  Created by dylan on 12/06/2021.
//

import SwiftUI

struct DetailedView: View {
    
    let artist: Artist
    
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 3)
    
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Image(artist.imageName).resizable()
                    .scaledToFit()
                    // .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
            
                
                Text(artist.name).bold()
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.top, 130)
            }
            
            Text("Biographie").bold()
                .underline()
                .foregroundColor(.gray)
                .padding(.leading)
            
            Text(artist.description).padding(.horizontal)
            
            Text("Titres").bold()
                .underline()
                .foregroundColor(.gray)
                .padding(.leading)
            
            LazyVGrid(columns: columns) {
                SongListCell()
                SongListCell()
                SongListCell()
                
            }
            
            Spacer()
        }
    }
    
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(artist: artist1)
    }
}
