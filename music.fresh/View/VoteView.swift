//
//  VoteView.swift
//  Test
//
//  Created by SPGJ on 14/06/2021.
//

import SwiftUI

struct VoteView: View {
    
    var positiveVote: Vote
    var negativeVote: Vote
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person.circle.fill")
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
                if vote1.positiveVote > vote1.negativeVote {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(.green)
                    Text("\(vote1.positiveVote + vote1.negativeVote)")
                        .foregroundColor(.green)
                    Image(systemName: "hand.thumbsdown")
                } else {
                    Image(systemName: "hand.thumbsup")
                    Text("191")
                        .foregroundColor(.red)
                    Image(systemName: "hand.thumbsdown.fill")
                        .foregroundColor(.red)
                }
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
        }
    }
}

struct VoteView_Previews: PreviewProvider {
    static var previews: some View {
        VoteView(positiveVote: vote5, negativeVote: vote5)
            .previewLayout(.sizeThatFits)
    }
}

