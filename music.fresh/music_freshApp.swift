//
//  music_freshApp.swift
//  music.fresh
//
//  Created by A_W on 11/06/2021.
//

import SwiftUI

@main
struct music_freshApp: App {
    @StateObject var playerSongs = PlayerSongs()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(playerSongs)
        }
    }
}
