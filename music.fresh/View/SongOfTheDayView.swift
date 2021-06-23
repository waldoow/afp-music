//
//  SongOfTheDayView.swift
//  music.fresh
//
//  Created by SPGJ on 14/06/2021.
//

import SwiftUI
import AVKit
var player : AVAudioPlayer!

struct MusicPlayer : View {
    @Environment(\.colorScheme) var colorScheme


    @State var playing = false
    @State var song = "herestous"
    
    @State var finish = false
    @State var del = AVdelegate()
    
    @Binding var songChanged : Bool
    
    var body : some View{
        
        VStack(spacing: 20){
            
            HStack {
                
                Button(action: {
                    songChanged.toggle()
                    if player.isPlaying{
                        player.pause()
                        self.playing = false
                    }
                    else{
                        if self.finish{
                            self.finish = false
                        }
                        player.play()
                        self.playing = true
                    }
                }) {
                    
                    Image(systemName: self.playing && !self.finish ? "pause.circle" : "play.circle").font(.system(size: 90))
                }
                
            }.padding(.top,25)
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            
        }.padding()
        .onAppear {
            
            let url = Bundle.main.path(forResource: self.song, ofType: "mp3")
            
            player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            
            player.delegate = self.del
            
            player.prepareToPlay()
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name("Finish"), object: nil, queue: .main) { (_) in
                
                self.finish = true
            }
        }
    }
}

class AVdelegate : NSObject,AVAudioPlayerDelegate{
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        NotificationCenter.default.post(name: NSNotification.Name("Finish"), object: nil)
    }
}


struct SongOfTheDayView: View {
    
    @State private var isPresented = false
    @Binding var songChanged: Bool
    
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
                Text("Découvrez de la vraie nouveauté, peu connue, que vous ne trouvez nul part ailleurs.")
                
                Spacer()
                
                // chanson du jour
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        VStack {
                            MusicPlayer(songChanged: $songChanged)
                        }
                        Spacer()
                        ZStack{
                            Image("Halestorm")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .opacity(0.3)
                                .padding()
                            VStack(alignment: .leading, spacing: 30){
                                Text("Here's To Us")
                                    .font(.title)
                                    .bold()
                                Text("2012")
                                    .font(.title)
                                    .bold()
                            }
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight:150)
                
                
                // Votes
                ScrollView(.vertical){
                    
                    VStack{
                        VoteView(vote: vote1, songChanged: $songChanged)
                            .frame(maxWidth: .infinity, maxHeight:150)
                        VoteView(vote: vote2, songChanged: $songChanged)
                            .frame(maxWidth: .infinity, maxHeight:150)
                        VoteView(vote: vote3, songChanged: $songChanged)
                            .frame(maxWidth: .infinity, maxHeight:150)
                        VoteView(vote: vote4, songChanged: $songChanged)
                            .frame(maxWidth: .infinity, maxHeight:150)
                        VoteView(vote: vote5, songChanged: $songChanged)
                            .frame(maxWidth: .infinity, maxHeight:150)
                    }
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke())
            }
            .padding()
            
        }
    }
}


struct SongOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        SongOfTheDayView(songChanged: .constant(true))
    }
}

