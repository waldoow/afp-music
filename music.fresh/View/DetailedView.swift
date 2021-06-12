//
//  DetailedView.swift
//  music.fresh
//
//  Created by dylan on 12/06/2021.
//

import SwiftUI

struct DetailedView: View {
    
    let artist: Artist
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Image(artist.imageName).resizable().scaledToFit()
                    .ignoresSafeArea()
                Text("Klemn Schen").bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.largeTitle)
                    .padding(.top, 150)
                }
            
            Text("Biographie")
                .underline()
                .bold()
                .foregroundColor(.gray)
                .font(.title3)
                .padding(.leading)
            
            Text(artist.description).padding(.horizontal)
                
            Spacer()
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(artist: artist1)
    }
}
