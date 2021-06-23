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
    @State var player : AVAudioPlayer!
    @State var playing = false
    @State var width : CGFloat = 0
    
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
                    //                    Text("Karen 0 feat.Michael Kiwanuka - Yo! My Saint")
                    //                        .font(.title2)
                    //                        .fontWeight(.bold)
                }
                Spacer(minLength: 0)
                
                if !expand{
                    
                    //                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    //
                    //                        Image(systemName:"play.fill")
                    //                            .font(.title2)
                    //                            .foregroundColor(.primary)
                    //                            .matchedGeometryEffect(id: "Label", in: animation)
                    //                    })
                    
                    Button(action: {
                        if self.player.isPlaying{
                            self.player.pause()
                            self.playing = false
                        }
                        else{
                            self.player.play()
                            self.playing = true
                            
                        }
                    }) {
                        Image(systemName: self.playing ? "pause.fill" : "play.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .matchedGeometryEffect(id: "Label", in: animation)
                        
                    }
                    
                    //                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    //
                    //                        Image(systemName:"forward.fill")
                    //                            .font(.title2)
                    //                            .foregroundColor(.primary)
                    //                    })
                    
                }
            }
            .padding(.horizontal)
            
            VStack(spacing: 15){
                
                Spacer(minLength: 0)
                
                //                HStack{
                
                if expand{
                    
                    Text(self.title).font(.headline).padding(.top).foregroundColor(.black)
                    //                        Text("Karen 0 feat.Michael Kiwanuka - Yo! My Saint")
                    //                            .font(.title2)
                    //                            .foregroundColor(.primary)
                    //                            .fontWeight(.bold)
                    //                            .matchedGeometryEffect(id: "Label", in: animation)
                }
                Spacer(minLength: 0)
                
                //                }
                //                .padding()
                //                .padding(.top)
                
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
                                        self.player.currentTime = Double(percent) * self.player.duration
                                        
                                    }))
                    
                }
                .frame(width: 350)
                .padding(.top, 30)
                
                // player buttons from smpv
                
                HStack(spacing: UIScreen.main.bounds.width / 5 - 35) {
                    Button(action: {
                        
                        
                    }) {
                        Image(systemName: "backward.fill").font(.title)
                        
                    }
                    
                    Button(action: {
                        self.player.currentTime -= 15
                        
                    }) {
                        Image(systemName: "gobackward.15").font(.title)
                        
                    }
                    
                    Button(action: {
                        if self.player.isPlaying{
                            self.player.pause()
                            self.playing = false
                        }
                        else{
                            self.player.play()
                            self.playing = true
                            
                        }
                    }) {
                        Image(systemName: self.playing ? "pause.fill" : "play.fill").font(.title)
                        
                    }
                    
                    Button(action: {
                        let increase = self.player.currentTime + 15
                        if increase < self.player.duration{
                            self.player.currentTime = increase
                        }
                        
                    }) {
                        Image(systemName: "goforward.15").font(.title)
                        
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "forward.fill").font(.title)
                        
                    }
                    
                }
                .padding(.bottom, 250)
                .foregroundColor(.black)
                
                // Live String...
                
                //                HStack{
                //
                //                    Capsule()
                //                        .fill(
                //                            LinearGradient(gradient: .init(colors:[Color.primary.opacity(0.7), Color.primary.opacity(0.1)]), startPoint: .leading, endPoint: .trailing)
                //
                //                        )
                //                        .frame(height: 4)
                //
                //                    Text("LIVE")
                //                        .fontWeight(.bold)
                //                        .foregroundColor(.primary)
                //
                //                    Capsule()
                //                        .fill(
                //                            LinearGradient(gradient: .init(colors:[Color.primary.opacity(0.1), Color.primary.opacity(0.7)]), startPoint: .leading, endPoint: .trailing)
                //
                //                        )
                //                        .frame(height: 4)
                //
                //                }
                //                .padding()
                
                // Stop Button...
                //                Button(action: {}) {
                //
                //                    Image(systemName: "stop.fill")
                //                        .font(.largeTitle)
                //                        .foregroundColor(.primary)
                //                }
                //                .padding()
                //
                //                Spacer(minLength: 0)
                // Stop Button.../
                
                //                HStack{
                //                    Image(systemName: "speaker.fill")
                //
                //                    Slider(value: $volume)
                //
                //                    Image(systemName: "speaker.wave.2.fill")
                //                }
                //                .padding()
                //                Spacer()
                
                //                HStack(spacing: 22){
                //
                //                    Button(action: {}) {
                //                        Image(systemName: "arrow.up.message")
                //                            .font(.title2)
                //                            .foregroundColor(.primary)
                //                    }
                //
                //                    Button(action: {}) {
                //                        Image(systemName: "airplayaudio")
                //                            .font(.title2)
                //                            .foregroundColor(.primary)
                //                    }
                //
                //                    Button(action: {}) {
                //                        Image(systemName: "list.bullet")
                //                            .font(.title2)
                //                            .foregroundColor(.primary)
                //                    }
                //
                //                }
                //                .padding(.bottom,safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
            }
            // this will give strech effect...
            .frame(height: expand ? nil : 0)
            .opacity(expand ? 1 : 0)
        }
        .onAppear {
            
            let url = Bundle.main.path(forResource: "ragnarok", ofType: "mp3")
            
            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            
            self.player.prepareToPlay()
            self.getData()
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                if self.player.isPlaying{
                    
                    let screen = UIScreen.main.bounds.width - 30
                    
                    let value = self.player.currentTime / self.player.duration
                    
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
    func getData(){
        let asset = AVAsset(url: self.player.url!)
        
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

//struct MiniPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        MiniPlayerView()
//    }
//}
