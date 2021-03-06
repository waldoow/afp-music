//
//  Vote.swift
//  music.fresh
//
//  Created by SPGJ on 15/06/2021.
//

import Foundation

struct Vote: Identifiable {
    var id = UUID()
    
    let user: User
    
    let positiveVote:Int
    let negativeVote: Int
    let comment: String
    
}

