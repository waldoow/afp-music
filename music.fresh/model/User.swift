//
//  User.swift
//  music.fresh
//
//  Created by lucie on 14/06/2021.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    
    var name: String
    var email: String
    var imageName: String?
    var password: String
    var imageName: String
    var recentSongs: [Song] = []
    var myPlaylists: [Playlist] = []
//  var myFriends: [Friend]
}
