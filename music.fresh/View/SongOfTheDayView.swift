//
//  SongOfTheDayView.swift
//  music.fresh
//
//  Created by SPGJ on 14/06/2021.
//

import SwiftUI

struct SongOfTheDayView: View {
    var body: some View {
        VStack{
            VStack{
                Image(systemName: "plus.circle")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                Text("Chanson du jour")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .font(.title)
            }
            Spacer()
            Text("Découvrez de la vraie nouveauté, peu connu, que vous ne trouvez pas sur les autres apps.")
            Spacer()
            Text("En attente de la AudioPlayerView")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight:150)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .background(Color.yellow)
            ZStack{
                Text(artist1.name)
//                    .foregroundColor(.white)
                    .offset(y: 60)
                Image(artist1.imageName)
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fill)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight:150)
            
            ScrollView(.vertical){
                
//                List {
//                    VoteView(positiveVote: voteList[0], negativeVote: voteList[0])
//                    VoteView(positiveVote: voteList[1], negativeVote: voteList[1])
//                    VoteView(positiveVote: voteList[2], negativeVote: voteList[2])
//                    VoteView(positiveVote: voteList[3], negativeVote: voteList[3])
//                    VoteView(positiveVote: voteList[4], negativeVote: voteList[4])
//                }
                
                VStack{
                    VoteView()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight:150)
                    VoteView()
                        .frame(maxWidth: .infinity, maxHeight:150)
                    VoteView()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight:150)
                    VoteView()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight:150)
                    VoteView()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight:150)
                }
            }
        }
        .padding()
    }
}

struct SongOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        SongOfTheDayView()
    }
}

