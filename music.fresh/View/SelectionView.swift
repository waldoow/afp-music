//
//  SelectionView.swift
//  music.fresh
//
//  Created by lucie on 14/06/2021.
//

import SwiftUI

struct SelectionView: View {
    var body: some View {
        
        HStack {
            Text("Ecoutes récentes")
            Text("Mes playlists")
            Text("Amis")
        }
        .frame(width: 320)
        .foregroundColor(Color.gray)
        
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}
