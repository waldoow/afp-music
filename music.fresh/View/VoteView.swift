//
//  VoteView.swift
//  Test
//
//  Created by SPGJ on 14/06/2021.
//

import SwiftUI
import AVKit

struct VoteView: View {
    
    let vote: Vote
    @State var addVote = 0
    @State var playing = false
    @Binding var songChanged : Bool
    
    @State var data : Data = .init(count: 0)
    @State var current = 0
    @State var title = ""
    @State var songs = ["ragnarok", "herestous", "la.brigade.du.kif", "klem", "vincent.malone", "manolo.gonzalez", "laura.cox"]
    
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
                // ajouter lecture du morceau sur recentSong, créer des recentSong
//                Image(systemName: "play.circle")
//                    .font(.largeTitle)
                
                Button(action: {
                    songChanged.toggle()
                    self.current = (self.current+1)%(self.songs.count)
                        self.ChangeSongs()
                        print("text")
                    
                }) {
                    Image(systemName: self.playing ? "pause.fill" : "play.circle")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                }
                
            }
            HStack{
                if vote.positiveVote >= vote.negativeVote {
                    Button(action: {
                        // action
                        if (addVote == 0) || (addVote == -1) {
                            addVote += 1
                        } else if (addVote == 1){
                            addVote -= 1
                        }
                    }) {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.green)
                    }
                    
                    Text("\(vote.positiveVote + vote.negativeVote + addVote)")
                        .foregroundColor(.green)
                    Button(action: {
                        // action
                        if (addVote == 0) || (addVote == 1) {
                            addVote -= 1
                        } else if (addVote == -1){
                            addVote += 1
                        }
                    }) {
                        Image(systemName: "hand.thumbsdown")
                            .foregroundColor(.black)
                    }
                } else {
                    Button(action: {
                        // action
                        if (addVote == 0) || (addVote == -1) {
                            addVote += 1
                        } else if (addVote == 1){
                            addVote -= 1
                        }
                    }) {
                        Image(systemName: "hand.thumbsup")
                            .foregroundColor(.black)
                    }
                    Text("\(vote.positiveVote + vote.negativeVote + addVote)")
                        .foregroundColor(.red)
                    Button(action: {
                        // action
                        if (addVote == 0) || (addVote == 1) {
                            addVote -= 1
                        } else if (addVote == -1){
                            addVote += 1
                        }
                        
                    }) {
                        Image(systemName: "hand.thumbsdown.fill")
                            .foregroundColor(.red)
                    }
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment: .leading)
            .onAppear{
                
//                ChangeSongs()
                
            }
            
        }
    }
    
    func ChangeSongs(){
        
        let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
        
        player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        
        self.data = .init(count: 0)
        self.title = ""
        
        player.prepareToPlay()
        self.getData()
        
        player.play()
        
        
    }
    
    func getData(){
        let asset = AVAsset(url: player.url!)
        
        for i in asset.commonMetadata{
            
            if i.commonKey?.rawValue == "artwork" {
                let data = i.value as! Data
                self.data = data
            }
            
            if i.commonKey?.rawValue == "title"{
                let title = i.value as! String
                self.title = title
            }
        }
    }
    
}

struct VoteView_Previews: PreviewProvider {
    static var previews: some View {
        VoteView(vote: vote5, addVote: 0, songChanged: .constant(true))
            .previewLayout(.sizeThatFits)
        
    }
}

