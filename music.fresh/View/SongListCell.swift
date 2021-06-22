//
//  SongListCell.swift
//  music.fresh
//
//  Created by dylan on 12/06/2021.
//

import SwiftUI

struct SongListCell: View {
    var body: some View {
        ZStack {
            Image("KlemPhoto").resizable()
                .frame(width: 100, height:  100)

            Image(systemName: "play").resizable()
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
        }
    }
}

struct SongListCell_Previews: PreviewProvider {
    static var previews: some View {
        SongListCell()
    }
}
