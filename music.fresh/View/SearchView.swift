//
//  SearchView.swift
//  music.fresh
//
//  Created by mac32 on 15/06/2021.
//

import SwiftUI

struct SearchView: View {
    @State private var selection = 0
    @State var currentTab = "Titres"
    @Namespace var animation
    @State private var showModal = false
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 0){
                SearchBar(searchText: .constant(" "))
                    .padding(.bottom, 20)
                HStack(alignment: .center, spacing: 0){
                    selectionsButton(title: "Titres", currentTab: $currentTab, animation: animation)
                    selectionsButton(title: "Playlists", currentTab: $currentTab, animation: animation)
                    selectionsButton(title: "Artistes", currentTab: $currentTab, animation: animation)
                }
                VStack{
                    if currentTab == "Titres" {
                        SongList(songs: songsList)
                    }
                    if currentTab == "Playlists" {
                        PlaylistList(playlists: playlistsList)
                    }
                    if currentTab == "Artistes" {
                        ArtistList(artists: artistsList)
                    }
                }
            }.navigationBarTitle("Rechercher")
            //            .toolbar {
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showModal.toggle()
                                    }, label: {
                                        Image(systemName: "plus")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(Color.yellow)
                                    })).sheet(isPresented: $showModal) {
                                        // mettre une View
                                    }
        }
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct selectionsButton: View {
    var title: String
    @Binding var currentTab: String
    var animation: Namespace.ID
    var body: some View {
        Button(action: {
            withAnimation {
                currentTab = title
            }
        }, label: {
            LazyVStack(spacing: 12){
                Text(title).fontWeight(.semibold)
                    
                    .foregroundColor(currentTab == title ? .yellow : .gray)
                    .padding(.horizontal)
                
                if currentTab == title {
                    Capsule()
                        .fill(Color.yellow)
                        .frame(height: 1.2)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                } else {
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 1.2)
                }
            }
        })
    }
}
