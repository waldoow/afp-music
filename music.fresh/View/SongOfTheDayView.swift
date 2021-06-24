//
//  SongOfTheDayView.swift
//  music.fresh
//
//  Created by SPGJ on 14/06/2021.
//

import SwiftUI
import AVKit

struct MusicPlayer : View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var player : AVAudioPlayer!
    @State var playing = false
    @State var song = "herestous"
    
    @State var finish = false
    @State var del = AVdelegate()
    
    var body : some View{
        
        VStack(spacing: 20){
            
            HStack {
                
                Button(action: {
                    if self.player.isPlaying{
                        self.player.pause()
                        self.playing = false
                    }
                    else{
                        if self.finish{
                            self.finish = false
                        }
                        self.player.play()
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
            
            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            
            self.player.delegate = self.del
            
            self.player.prepareToPlay()
            
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
    
    @State private var showingSheet = false
//    @State private var showModal = false
    @State private var annuler = false
    
    var body: some View {
        
        
        NavigationView {
            
            VStack{
                
                NavigationLink(destination: AddSongOfTheDayView(annuler: $annuler)){
                
                                }
                                .navigationTitle("Chanson du jour")
                                // bouton lien vers modale
                                .navigationBarItems(trailing: Button(action: {
                                    self.annuler.toggle()
                                }, label: {
                                    Image(systemName: "plus")
                                })
                                .sheet(isPresented: $annuler) {
                                    AddSongOfTheDayView(annuler: $annuler)
                                })
                
                Spacer()
                Text("Découvrez de la vraie nouveauté, peu connue, que vous ne trouvez nul part ailleurs.")
                
                Spacer()
                
                // chanson du jour
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        VStack {
                            MusicPlayer()
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
                        Text("Propositions des utilisateurs")
                            .bold()
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
        SongOfTheDayView()
    }
}

