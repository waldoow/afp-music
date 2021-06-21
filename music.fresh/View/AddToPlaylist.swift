//
//  CreatePlaylist.swift
//  music.fresh
//
//  Created by mac32 on 18/06/2021.
//

import SwiftUI

struct AddToPlaylist: View {
    @Binding var showModalAddToPlaylist: Bool
    @State var showModal = false

    var body: some View {
        NavigationView{
            VStack{
                Button(action: {
                    self.showModal = true
                }, label: {
                    Text("Nouvelle playlist")
                        .font(.system(size: 18))
                        .padding(10)
                        .padding(.horizontal, 20)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                })
                PlaylistList(playlists: playlistsList)
                Spacer()
                .padding(20)
                .sheet(isPresented: $showModal) {
                    NewPlaylistView(showModal: $showModal)
                }
            }.navigationBarTitle(Text("Ajouter à la playlist"), displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.showModalAddToPlaylist.toggle()
                                    }, label: {
                                        Text("Annuler")
                                            .foregroundColor(.yellow)
                                    }))
        }
    }
}
