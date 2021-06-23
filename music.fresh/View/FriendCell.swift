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
        HStack{
            
            
            Image(utilisateur.imageName ?? "")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
                .clipped()
            HStack{
                Text(utilisateur.name).font(.title3)
                
// Vaut mieux éviter ce bouton x)
                
//                Button(action: {
//
//                }, label: {
//                    if utilisateur.isFavorite == true {
//                        
//                        Image(systemName: "star")
//                            .foregroundColor(.yellow)
//                            .padding(8)
//                            .cornerRadius(20)
//                    } else {
//                        Image(systemName: "star.fill")
//                            .foregroundColor(.yellow)
//                            .padding(8)
//                            .cornerRadius(20)
//                    }
//                })
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct FriendCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendCell(utilisateur: user1)
    }
}
