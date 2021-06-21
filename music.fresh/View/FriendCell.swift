//
//  FriendCell.swift
//  music.fresh
//
//  Created by dylan on 21/06/2021.
//

import SwiftUI

struct FriendCell: View {
    let utilisateur: User
    var body: some View {
        HStack {
            
            Image(utilisateur.imageName).resizable()
                .frame(width: 100, height: 100)
            VStack(alignment: .leading) {
                Text(utilisateur.name).font(.title2)
                Button(action: {
                    
                }, label: {
                    if utilisateur.isFavorite == true {
                        
                        Label("Ne plus suivre", systemImage: "star")
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.blue)
                    } else {
                        Label("Suivre", systemImage: "star")
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.blue)
                    }
                    
                })
            }
        }
    }
}

struct FriendCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendCell(utilisateur: user1)
    }
}
