//
//  SearchBar.swift
//  music.fresh
//
//  Created by mac32 on 15/06/2021.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.systemGray4))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Titres, playlists ou artistes ..", text: $searchText)
                
            }
            .foregroundColor(.white)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(" "))
    }
}
