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
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text("Chanson du jour")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
            }
            Spacer()
            Text("Découvrez de la vraie nouveauté, peu connu, que vous ne trouvez pas sur les autres apps.")
            Spacer()
            Text("En attente de la AudioPlayerView")
                .frame(maxWidth: .infinity, maxHeight:150)
                .foregroundColor(.blue)
                .background(Color.yellow)
            ZStack{
                Image("user1.jpg")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                Text(artist1.name)
                    .foregroundColor(.white)
                    .offset(y: 60)
            }
            .frame(maxWidth: .infinity, maxHeight:150)
            
            ScrollView(.vertical){
                
                VStack{
                    // mettre tableau vote
                    VoteView(vote: vote1)
                        .frame(maxWidth: .infinity, maxHeight:150)
                    VoteView(vote: vote2)
                        .frame(maxWidth: .infinity, maxHeight:150)
                    VoteView(vote: vote3)
                        .frame(maxWidth: .infinity, maxHeight:150)
                    VoteView(vote: vote4)
                        .frame(maxWidth: .infinity, maxHeight:150)
                    VoteView(vote: vote5)
                        .frame(maxWidth: .infinity, maxHeight:150)
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

