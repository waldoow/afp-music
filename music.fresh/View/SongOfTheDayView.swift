//
//  SongOfTheDayView.swift
//  music.fresh
//
//  Created by SPGJ on 14/06/2021.
//

import SwiftUI

struct SongOfTheDayView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack{
                
                NavigationLink(destination: AddSongOfTheDayView()){
                    
                }
                .navigationTitle("Chanson du jour")
                // bouton lien vers modale
                .navigationBarItems(trailing: Button("+") {
                    isPresented.toggle()
                }
                .fullScreenCover(isPresented: $isPresented, content: AddSongOfTheDayView.init)
                .font(.largeTitle)
                )
                
                Spacer()
                Text("Découvrez de la vraie nouveauté, peu connu, que vous ne trouvez pas sur les autres apps.")
                
                Spacer()
                
                ZStack{
                    Image("halestorm")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.3)
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Image(systemName: "play")
                                .padding()
                            VStack(alignment: .leading){
                                Text("Here's To Us")
                                    .font(.title)
                                    .bold()
                                    .padding(.vertical)
                                //                            .foregroundColor(.red)
                                Text("2012")
                                    .font(.title)
                                    .bold()
                                    .padding(.vertical)
                                //
                            }
//                            .foregroundColor(.red)
                        }
                        
                        
                    }
                    
                }
                
                .frame(maxWidth: .infinity, maxHeight:150)
                
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
        //        .edgesIgnoringSafeArea(.top)
    }
}


struct SongOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        SongOfTheDayView()
    }
}

