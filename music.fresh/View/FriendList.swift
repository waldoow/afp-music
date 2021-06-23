//
//  FriendList.swift
//  music.fresh
//
//  Created by dylan on 21/06/2021.
//

import SwiftUI

struct FriendList: View {
    var userlist = usersList
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                FriendCell(utilisateur: user1)
                FriendCell(utilisateur: user3)
            }
        }
        .padding(.top, 15)
    }
}

struct FriendList_Previews: PreviewProvider {
    static var previews: some View {
        FriendList()
    }
}
