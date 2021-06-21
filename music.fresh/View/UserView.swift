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
                    .font(.body)
                    .foregroundColor(Color(.systemTeal)),
                
                trailing:
                    HStack {
                        VStack {
                            Button(action: {
                                showingSheet.toggle()
                            }, label: {
                                Image(systemName: "gearshape")
                                    .foregroundColor(.lightBlueEnd)
                                    .padding(.bottom, 5)
                            }
                            ).sheet(isPresented: $showingSheet) {
                                ProfileUpdateForm()
                            }
                            
                            Button(action: {
                                showModal.toggle()
                            }, label: {
                                Image(systemName: "plus")
                                    .foregroundColor(.lightBlueEnd)
                            }
                            ).sheet(isPresented: $showModal) {
                                NewPlaylistView(showModal: $showingSheet)
                            }
                        }
                        Image(user.imageName ?? "")
                            .resizable()
                            .frame(width: 60, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                            .overlay(Circle().stroke(Color.lightBlueEnd, lineWidth: 5))
                    }
            )
            .padding(.top, 50)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: user1)
    }
}


//        NavigationView {
//            VStack {
//                Text("selectionView")
//            }
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//            .background(LinearGradient(Color.lightBlueEnd, Color.lightBlueStart))
//            .navigationBarItems(
//                leading:
//                    Text(user.name)
//                    .font(.body)
//                    .foregroundColor(Color(.systemTeal)),
//
//                trailing:
//                    HStack {
//                        Button(action: {
//                            showingSheet.toggle()
//
//                        }, label: {
//                            Image(systemName: "gearshape")
//                                .foregroundColor(.lightBlueEnd)
//                        }
//                        ).sheet(isPresented: $showingSheet) {
//                            ProfileUpdateForm()
//                        }
//
//                        Image(user.imageName!)
//                            .resizable()
//                            .frame(width: 60, height: 100)
//                            .clipShape(Circle())
//                            .shadow(radius: 5)
//                            .overlay(Circle().stroke(Color.lightBlueEnd, lineWidth: 5))
//                    }
//            )
//            .edgesIgnoringSafeArea(.top)
//            .edgesIgnoringSafeArea(.bottom)
//        }
