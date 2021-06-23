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
            VStack(alignment: .leading){
                Text(utilisateur.name).font(.title3)
                Button(action: {
                    
                }, label: {
                    if utilisateur.isFavorite == true {
                        
                        Label("Ne plus suivre", systemImage: "star")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.yellow)
                            .cornerRadius(20)
                    } else {
                        Label("Suivre", systemImage: "star.fill")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.yellow)
                            .cornerRadius(20)
                    }
                })
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
