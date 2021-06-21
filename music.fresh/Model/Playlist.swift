//
//  Playlist.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import Foundation
import SwiftUI

struct Playlist: Identifiable {
    var id = UUID()
    
    let title: String
    let user: String
    let imageName: UIImage?
    let year: Int
    let songs: [Song]
}
