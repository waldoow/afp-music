//
//  SongOfTheDayView.swift
//  music.fresh
//
//  Created by SPGJ on 14/06/2021.
//

import SwiftUI

struct SongOfTheDayView: View {
    var body: some View {
        NavigationView {
            VStack{
                
                NavigationLink(destination: AddSongOfTheDayView(name: "Halestorm", title: "Do Not Disturb", url: "https://www.youtube.com/watch?v=WZNb8A48USo", year: "2018", description: "Halestorm est un groupe de heavy metal américain, originaire de York, en Pennsylvanie. Le groupe est actuellement signé chez Atlantic Records et a réalisé son premier album éponyme en avril 2009. Suit The Strange Case of... en 2012, dont le premier single, Love Bites (So Do I), qui est récompensé d'un Grammy Award dans la catégorie de la meilleure chanson hard rock/metal, le 10 février 2013. En 2015 sort l'album Into the Wild Life. Et en 2018 le groupe sort l'album Vicious, avec le single Uncomfortable qui est nommé au Grammy Award dans la catégorie meilleure prestation rock. Ils ont également sorti plusieurs EP, notamment des albums de reprises.")){

                }
                .navigationTitle("Chanson du jour")
                .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                Image(systemName: "plus.circle")
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            })
                
                //                VStack{
                //                    Text("Chanson du jour")
                //                        .frame(maxWidth: .infinity, alignment: .leading)
                //                        .font(.title)
                //                }
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
                    //                    .aspectRatio(contentMode: .fit)
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
        //        .edgesIgnoringSafeArea(.top)
    }
}

struct SongOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        SongOfTheDayView()
    }
}

