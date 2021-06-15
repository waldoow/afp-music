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
                
                VStack{
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

