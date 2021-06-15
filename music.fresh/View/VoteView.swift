//
//  VoteView.swift
//  Test
//
//  Created by SPGJ on 14/06/2021.
//

import SwiftUI

struct VoteView: View {
    
    let vote: Vote
    @State var addVote: Int = 0
    
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
                    Button(action: {
                        // action
                        addVote += 1
                    }) {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.green)
                    }
                    
                    Text("\(vote.positiveVote + vote.negativeVote)")
                        .foregroundColor(.green)
                    Button(action: {
                        // action
                        addVote -= 1
                    }) {
                        Image(systemName: "hand.thumbsdown")
                    }
                } else {
                    Button(action: {
                        // action
                        addVote += 1
                    }) {
                        Image(systemName: "hand.thumbsup")
                    }
                    Text("\(vote.positiveVote + vote.negativeVote + addVote)")
                        .foregroundColor(.red)
                    Button(action: {
                        // action
                        addVote -= 1
                    }) {
                        Image(systemName: "hand.thumbsdown.fill")
                            .foregroundColor(.red)
                    }
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
        }
    }
}

struct VoteView_Previews: PreviewProvider {
    static var previews: some View {
        VoteView(vote: vote5, addVote: 0)
            .previewLayout(.sizeThatFits)
        
    }
}
