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
    @State var width : CGFloat = 0
    
    @EnvironmentObject var playerSongs: PlayerSongs

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
                
                Image(playerSongs.inLineSongs[playerSongs.currentIndex].imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: expand ? height : 55, height: expand ? height : 55)
                    .cornerRadius(15)
                
                if !expand{
                    Text(playerSongs.title).font(.callout).padding(.bottom).foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
                Spacer(minLength: 0)
                
                if !expand {
                    Button(action: {
                        if playerSongs.player.isPlaying {
                            playerSongs.player.pause()
                            playerSongs.playing = false
                        }
                        else{
                            playerSongs.player.play()
                            playerSongs.playing = true
                            
                        }
                    }) {
                        Image(systemName: playerSongs.playing ? "pause.fill" : "play.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .matchedGeometryEffect(id: "Label", in: animation)
                        
                    }
                }
            }
            .padding(.horizontal)
            
            VStack(spacing: 15){
                Spacer(minLength: 0)
                if expand{
                    Text(playerSongs.title).font(.headline).padding(.top).foregroundColor(colorScheme == .dark ? Color.white : Color.black)

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
                                        playerSongs.player.currentTime = Double(percent) * playerSongs.player.duration
                                        
                                    }))
                    
                }
                .frame(width: 350)
                .padding(.top, 30)
                
                // player buttons from smpv
                
                HStack(spacing: UIScreen.main.bounds.width / 5 - 35) {
                    Button(action: {
                        playerSongs.prepare()
                        playerSongs.previous()
                    }) {
                        Image(systemName: "backward.fill").font(.title)
                    }
                    
                    Button(action: {
                        playerSongs.player.currentTime -= 15
                    }) {
                        Image(systemName: "gobackward.15").font(.title)
                    }
                    
                    Button(action: {
                        if playerSongs.player.isPlaying{
                            playerSongs.player.pause()
                            playerSongs.playing = false
                        }
                        else{
                            playerSongs.player.play()
                            playerSongs.playing = true
                            
                        }
                    }) {
                        Image(systemName: playerSongs.playing ? "pause.fill" : "play.fill").font(.title)
                        
                    }
                    
                    Button(action: {
                        let increase = playerSongs.player.currentTime + 15
                        if increase < playerSongs.player.duration{
                            playerSongs.player.currentTime = increase
                        }
                        
                    }) {
                        Image(systemName: "goforward.15").font(.title)
                        
                    }
                    
                    Button(action: {
                        playerSongs.prepare()
                        playerSongs.next()
                        
                    }) {
                        Image(systemName: "forward.fill").font(.title)
                        
                    }
                    
                }
                .padding(.bottom, 250)
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            }
            // this will give strech effect...
            .frame(height: expand ? nil : 0)
            .opacity(expand ? 1 : 0)
        }
        .onAppear {
            playerSongs.prepare()
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                if playerSongs.player.isPlaying{
                    let screen = UIScreen.main.bounds.width - 30
                    let value = playerSongs.player.currentTime / playerSongs.player.duration
                    self.width = screen * CGFloat(value)
                }
            }
        }
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
}
