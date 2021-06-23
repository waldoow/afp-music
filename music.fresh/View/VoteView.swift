//
//  VoteView.swift
//  Test
//
//  Created by SPGJ on 14/06/2021.
//

import SwiftUI

struct VoteView: View {
    
    let vote: Vote
    @State var addVote = 0
    @State var votePositif: Bool = false
    @State var voteNegatif: Bool = false
    
    var body: some View {
        
        VStack{
            HStack{
                Image(vote.user.imageName ?? "")
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
                Image(systemName: "play.circle")
                    .font(.largeTitle)
            }
            HStack{
                Button(action: {
                    if addVote == 0 && votePositif == false && voteNegatif == false {
                        addVote += 1
                        votePositif = true
                    } else if addVote == 1 && votePositif == true {
                        addVote -= 1
                        votePositif = false
                    }
                }) {
                    if addVote == 1 && votePositif == true && voteNegatif == false {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.green)
                        
                    } else {
                        
                        Image(systemName: "hand.thumbsup")
                            .foregroundColor(.black)
                    }
                }
                
                if vote.positiveVote >= vote.negativeVote {
                    Text("\(vote.positiveVote + vote.negativeVote + addVote)")
                        .foregroundColor(.green)
                } else if vote.positiveVote < vote.negativeVote {
                    Text("\(vote.positiveVote + vote.negativeVote + addVote)")
                        .foregroundColor(.red)
                }
                
                
                Button(action: {
                    if addVote == 0 && voteNegatif == false && votePositif == false {
                        addVote += 1
                        voteNegatif = true
                    } else if addVote == 1  && voteNegatif == true {
                        addVote -= 1
                        voteNegatif = false
                    }
                }) {
                    if addVote == 1 && votePositif == false && voteNegatif == true {
                        Image(systemName: "hand.thumbsdown.fill")
                            .foregroundColor(.red)
                        
                    } else {
                        
                        Image(systemName: "hand.thumbsdown")
                            .foregroundColor(.black)
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

