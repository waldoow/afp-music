//
//  Playlist.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import Foundation

struct Playlist: Identifiable {
    var id = UUID()
    
    let title: String
    let user: String
    let imageName: String
    let year: Int
    let songs: [Song]
}
