//
//  UserView.swift
//  music.fresh
//
//  Created by lucie on 14/06/2021.
//

import SwiftUI

extension Color {
    static let lightBlueStart = Color(red: 109 / 255, green: 213 / 255, blue: 250 / 255)
    static let lightBlueEnd = Color(red: 41 / 255, green: 128 / 255, blue: 185 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing)
    }
}

struct UserView: View {
    let user : User
    
    @State private var showingSheet = false
    @State private var showModal = false
    @State private var selection = 0
    @State var currentTab = "Récents"
    @Namespace var animation
    @State private var isPresented = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 0){
                HStack(alignment: .center, spacing: 0){
                    selectionsButton(title: "Récents", currentTab: $currentTab, animation: animation)
                    selectionsButton(title: "Playlists", currentTab: $currentTab, animation: animation)
                    selectionsButton(title: "Mes amis", currentTab: $currentTab, animation: animation)
                }
                VStack{
                    if currentTab == "Récents" {
                        SongList(songs: songsList)
                    }
                    if currentTab == "Playlists" {
                        PlaylistList(playlists: playlistsList)
                    }
                }
            }
            .navigationBarItems(
                leading:
                    Text(user.name)
                    .font(.headline)
                    .foregroundColor(Color(.purple)),
                
                trailing:
                    HStack {
                        VStack {
                            Button(action: {
                                showingSheet.toggle()
                            }, label: {
                                Image(systemName: "gearshape")
                                    .foregroundColor(Color(.purple))
                                    .padding(.bottom, 5)
                            })
                            .sheet(isPresented: $showingSheet) {
                                ProfileUpdateForm()
                            }
                            
                            Button(action: {
                                showModal.toggle()
                            }, label: {
                                Image(systemName: "plus")
                                    .foregroundColor(Color(.purple))
                                    .padding(.bottom, 5)
                            })
                            .sheet(isPresented: $showModal) {
                                NewPlaylistView(showModal: $showModal)
                            }
                            
                        }
                        
                        Image(user.imageName ?? "")
                            .resizable()
                            .frame(width: 60, height: 75)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .overlay(Circle().stroke(Color.white, lineWidth: 5))
                    }
            )
            .padding(.top, 10)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: user2)
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

