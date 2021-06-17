//
//  User.swift
//  music.fresh
//
//  Created by lucie on 14/06/2021.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    
    let name: String
    let email: String
    let imageName: String?
    var recentSongs: [Song] = []
    var myPlaylists: [Playlist] = []
//    var myFriends: [Friend]
}
