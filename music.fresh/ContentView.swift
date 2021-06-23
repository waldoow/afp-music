//
//  ContentView.swift
//  music.fresh
//
//  Created by A_W on 11/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int = 1

    //miniplayer properties...
    @State var expand = false
    @Namespace var animation
    @State var songChanged : Bool = false

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            TabView(selection: $selection, content:  {
                SongOfTheDayView(songChanged: $songChanged)
                    .padding(.bottom, 70)
                    .tabItem {
                        VStack {
                            Image(systemName: "music.note")
                            Text("Découvrir")
                        }
                    }.tag(1)
                SearchView()
                    .padding(.bottom, 45)
                    .tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Recherche")
                        }
                    }.tag(2)
                UserView(user: user1)
                    .padding(.bottom, 50)
                    .tabItem {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Mon espace")
                        }
                    }.tag(2)
            })
            
            MiniPlayerView(animation: animation, expand: $expand, songChanged: songChanged)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
