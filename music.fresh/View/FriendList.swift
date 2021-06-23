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
        VStack(alignment: .leading) {
            FriendCell(utilisateur: user1)
            FriendCell(utilisateur: user2)
            FriendCell(utilisateur: user3)
        }
    }
}

struct FriendList_Previews: PreviewProvider {
    static var previews: some View {
        FriendList()
    }
}
