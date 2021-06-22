//
//  Artist.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import Foundation

struct Artist: Identifiable, Hashable {
    var id = UUID()
    
    let name: String
    let imageName: String
    let description: String
    // let artistSong: [Song]
}
