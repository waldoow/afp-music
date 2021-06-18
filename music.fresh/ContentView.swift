//
//  ContentView.swift
//  music.fresh
//
//  Created by A_W on 11/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int = 1
    var body: some View {
        TabView(selection: $selection,
                content:  {
                    SongOfTheDayView()
                        .tabItem {
                            VStack {
                                Image(systemName: "music.note")
                                Text("Découvrir")
                            }
                        }.tag(1)
                    Text("Tab Content 2")
                        .tabItem {
                            VStack {
                                Image(systemName: "magnifyingglass")
                                Text("Recherche")
                            }
                        }.tag(2)
                    Text("Tab Content 3")
                        .tabItem {
                            VStack {
                                Image(systemName: "person.fill")
                                Text("Mon espace")
                            }
                        }.tag(2)
                })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
