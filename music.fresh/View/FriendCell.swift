//
//  FriendCell.swift
//  music.fresh
//
//  Created by dylan on 21/06/2021.
//

import SwiftUI

struct FriendCell: View {
    let utilisateur: User
    let colorback = Color(red: 0, green: 0, blue: 0, opacity: 0.1)
    var body: some View {
        HStack{
            
            
            Image(utilisateur.imageName).resizable()
                .frame(width: 100, height: 100)
            Spacer()
            VStack(alignment: .center) {
                Text(utilisateur.name).font(.title3)
                Button(action: {
                    
                }, label: {
                    if utilisateur.isFavorite == true {
                        
                        Label("Ne plus suivre", systemImage: "star")
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.blue)
                            .cornerRadius(20)
                    } else {
                        Label("Suivre", systemImage: "star")
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    
                })
            }
            Spacer()
        }.background(colorback)
        .padding(.horizontal)
    }
}

struct FriendCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendCell(utilisateur: user1)
    }
}
