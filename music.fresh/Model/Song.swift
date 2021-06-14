//
//  SongModel.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import Foundation

struct Song: Identifiable {
    
    var id = UUID()
    
    let title: String
    let artist: String
    let description: String
    let imageName: String
    let url: String
    let year: Int
}