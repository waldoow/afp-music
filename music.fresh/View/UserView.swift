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
            Text(user.name)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: user1)
    }
}
