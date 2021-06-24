//
//  MiniPlayerView.swift
//  music.fresh
//
//  Created by lucie on 22/06/2021.
//

import SwiftUI
import AVKit

struct MiniPlayerView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var animation: Namespace.ID
    @Binding var expand : Bool
    var height = UIScreen.main.bounds.height / 3
    
    // saferea...
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
    // Volume Slider...
    @State var volume : CGFloat = 0
    // gesture Offset...
    @State var offset : CGFloat = 0
    //smallmusicplayer
    @State var data : Data = .init(count: 0)
    @State var title = ""
//    @State var player : AVAudioPlayer!
    @State var playing = false
    @State var width : CGFloat = 0
    @State var songs = ["ragnarok", "herestous", "la.brigade.du.kif", "klem", "vincent.malone", "manolo.gonzalez", "laura.cox"]
    @State var current = 0
    
    var songChanged: Bool
    
    var body: some View {
        
        VStack{
            Capsule()
                .fill(Color.gray)
                .frame(width: expand ? 60 : 0, height: expand ? 4 : 0)
                .opacity(expand ? 1 : 0)
                .padding(.top, expand ? safeArea?.top : 0)
                .padding(.vertical, expand ? 30 : 0)
            
            HStack(spacing: 15){
                
                // centering image...
                
                if expand{Spacer(minLength: 0)}
                
                Image("ragnarok.cover")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: expand ? height : 55, height: expand ? height : 55)
                    .cornerRadius(15)
                
                if !expand{
                    Text(self.title).font(.callout).padding(.bottom).foregroundColor(colorScheme == .dark ? Color.white : Color.black)

                }
                Spacer(minLength: 0)
                
                if !expand{
                    
                    Button(action: {
                        if player.isPlaying{
                            player.pause()
                            self.playing = false
                        }
                        else{
                            player.play()
                            self.playing = true
                            
                        }
                    }) {
                        Image(systemName: self.playing ? "pause.fill" : "play.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .matchedGeometryEffect(id: "Label", in: animation)
                        
                    }
                    
                }
            }
            .padding(.horizontal)
            
            VStack(spacing: 15){
                
                Spacer(minLength: 0)
                
                //                HStack{
                
                if expand{
                    
                    Text(self.title).font(.headline).padding(.top).foregroundColor(.black)
                    
                }
                Spacer(minLength: 0)
                
                
                //capsule bar from smpv
                
                ZStack(alignment: .leading) {
                    Capsule().fill(Color.black.opacity(0.08)).frame(height: 10)
                    
                    Capsule().fill(Color.red).frame(width: self.width, height: 10)
                        .gesture(DragGesture()
                                    .onChanged({ (value) in
                                        
                                        let x = value.location.x
                                        self.width = x
                                        
                                    }).onEnded({ (value) in
                                        
                                        let x = value.location.x
                                        let screen = UIScreen.main.bounds.width - 30
                                        let percent = x / screen
                                        player.currentTime = Double(percent) * player.duration
                                        
                                    }))
                    
                }
                .frame(width: 350)
                .padding(.top, 30)
                
                // player buttons from smpv
                
                HStack(spacing: UIScreen.main.bounds.width / 5 - 45) {
                    Button(action: {
                        
                        if self.current > 0{
                            self.current -= 1
                            self.ChangeSongs()
                        }
                        
                    }) {
                        Image(systemName: "backward.fill").font(.title)
                        
                    }
                    
                    Button(action: {
                        player.currentTime -= 15
                        
                    }) {
                        Image(systemName: "gobackward.15").font(.title)
                        
                    }
                    
                    Button(action: {
                        if player.isPlaying{
                            player.pause()
                            self.playing = false
                        }
                        else{
                            player.play()
                            self.playing = true
                            
                        }
                    }) {
                        Image(systemName: self.playing ? "pause.fill" : "play.fill").font(.title)
                        
                    }
                    
                    Button(action: {
                        let increase = player.currentTime + 15
                        if increase < player.duration{
                            player.currentTime = increase
                        }
                        
                    }) {
                        Image(systemName: "goforward.15").font(.title)
                        
                    }
                    
                    Button(action: {
                        
                        if self.songs.count - 1 != self.current{
                            self.current += 1
                            self.ChangeSongs()
                        }
                        
                    }) {
                        Image(systemName: "forward.fill").font(.title)
                        
                    }
                    
                }
                .padding(.bottom, 250)
                .foregroundColor(.black)
            }
            // this will give strech effect...
            .frame(height: expand ? nil : 0)
            .opacity(expand ? 1 : 0)
        }
        .onAppear {
            
            let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")

            player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))

            player.prepareToPlay()
            self.getData()
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                if player.isPlaying{
                    
                    let screen = UIScreen.main.bounds.width - 30
                    
                    let value = player.currentTime / player.duration
                    
                    self.width = screen * CGFloat(value)
                }
            }
        }
        
        .onChange(of: songChanged, perform: { value in
            getData()
        })
        
        
        
        //expanding to full screen when clicked...
        .frame(maxHeight: expand ? .infinity : 80)
        .background(
            VStack(spacing: 0){
                BlurView()
                Divider()
            }
            .onTapGesture(perform: {
                
                withAnimation(.spring()){expand = true}
                
            })
        )
        
        .cornerRadius(expand ? 20 : 0)
        .offset(y: expand ? 0 : -48)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onended(value:)).onChanged(onchanged(value:)))
        .ignoresSafeArea()
    }
    
    func onchanged(value: DragGesture.Value){
        
        // only allowing when it's expanded...
        if value.translation.height > 0 && expand {
            
            offset = value.translation.height
        }
    }
    
    func onended(value: DragGesture.Value){
        
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)){
            
            // if value is > than height / 3 then closing view...
            
            if value.translation.height > height{
                
                expand = false
            }
            offset = 0
        }

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
    
    func ChangeSongs(){
        
        let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
        
        player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        
        self.data = .init(count: 0)
        self.title = ""
        
        player.prepareToPlay()
        self.getData()
        
        player.play()
        
        
    }
}

//struct MiniPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        MiniPlayerView()
//    }
//}
