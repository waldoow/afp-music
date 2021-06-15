//
//  SearchView.swift
//  music.fresh
//
//  Created by mac32 on 15/06/2021.
//

import SwiftUI

struct SearchView: View {
    @State private var selection = 0
    //    @State var currentTab = "Titres"
    //    @Namespace var animation
    var body: some View {
        //                VStack(alignment: .center, spacing: 0){
        //                    GeometryReader { geometry in
        //                        ScrollView(.horizontal, showsIndicators: false, content: {
        //                            HStack(alignment: .center, spacing: 0){
        //                                selectionsButton(title: "Titres", currentTab: $currentTab, animation: animation)
        //                                selectionsButton(title: "Playlists", currentTab: $currentTab, animation: animation)
        //                                selectionsButton(title: "Artistes", currentTab: $currentTab, animation: animation)
        //                            }
        //                            .frame(width: geometry.size.width)
        //                        })
        //                    }
        //                    .padding(.top, 20)
        VStack{
            Picker("", selection: $selection) {
                Text("Titres").tag(0)
                Text("Playlists").tag(1)
                Text("Artistes").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
            if selection == 0 {
                SongList(songs: songsList)
            } else if selection == 1 {
                PlaylistList(playlists: playlistsList)
            } else if selection == 2 {
                ArtistList(artists: artistsList)
            }
            Spacer()
        }
    }
}
//    }
//}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

//struct selectionsButton: View {
//    var title: String
//    @Binding var currentTab: String
//    var animation: Namespace.ID
//    var body: some View {
//        Button(action: {
//            withAnimation {
//                currentTab = title
//            }
//        }, label: {
//            LazyVStack(spacing: 12){
//                Text(title).fontWeight(.semibold)
//
//                    .foregroundColor(currentTab == title ? .yellow : .gray)
//                    .padding(.horizontal)
//
//                if currentTab == title {
//                    Capsule()
//                        .fill(Color.yellow)
//                        .frame(height: 1.2)
//                        .matchedGeometryEffect(id: "TAB", in: animation)
//                } else {
//                    Capsule()
//                        .fill(Color.clear)
//                        .frame(height: 1.2)
//                }
//            }
//        })
//    }
//}
