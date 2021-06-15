//
//  VoteView.swift
//  Test
//
//  Created by SPGJ on 14/06/2021.
//

import SwiftUI

struct VoteView: View {
    
    let vote: Vote
    
    var body: some View {
        VStack{
            HStack{
                Image(vote.user.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50,height: 50)
                    .cornerRadius(50)
                    
                Text(vote.user.name)
                    .bold()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
            HStack{
                Text(vote.comment)
                    .frame(height: 50)
                Spacer()
                Image(systemName: "play.rectangle.fill")
                    .font(.largeTitle)
            }
            HStack{
                if vote.positiveVote > vote.negativeVote {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(.green)
                    Text("\(vote.positiveVote + vote.negativeVote)")
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
        VoteView(vote: vote5)
            .previewLayout(.sizeThatFits)
            
    }
}

