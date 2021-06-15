//
//  VoteView.swift
//  Test
//
//  Created by SPGJ on 14/06/2021.
//

import SwiftUI

struct VoteView: View {
    
    var positiveVote:Int
    var negativeVote: Int
    var voteResult: Int
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person.circle.fill")
                Text("")
                Text("UserName")
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
            HStack{
                Text("Bonjour, je vous propose d'écouter cette chanson, elle est incroyable, le titre c'est...")
                Spacer()
                Image(systemName: "play.rectangle.fill")
                    .font(.largeTitle)
            }
            HStack{
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.green)
                Text("191")
                Image(systemName: "hand.thumbsdown")
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
        }
    }
}

struct VoteView_Previews: PreviewProvider {
    static var previews: some View {
        VoteView(positiveVote: 200, negativeVote: 100, voteResult: 100)
            .previewLayout(.sizeThatFits)
    }
}

