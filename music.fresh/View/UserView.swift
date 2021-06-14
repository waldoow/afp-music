//
//  UserView.swift
//  music.fresh
//
//  Created by lucie on 14/06/2021.
//

import SwiftUI

struct UserView: View {
    let user : User
    
    var body: some View {
        VStack {
            Image(user.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.blue, lineWidth: 5))
                .padding(5)
            Text(user.name)
                .fixedSize()
                .font(.caption)
                .padding(5)
        }
        .frame(width: 320, height: 130,alignment: .trailing)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: user1)
    }
}
