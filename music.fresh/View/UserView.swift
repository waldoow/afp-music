//
//  UserView.swift
//  music.fresh
//
//  Created by lucie on 14/06/2021.
//

import SwiftUI

extension Color {
    static let darkBlueStart = Color(red: 0 / 255, green: 78 / 255, blue: 146 / 255)
    static let darkBlueEnd = Color(red: 0 / 255, green: 4 / 255, blue: 40 / 255)
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct UserView: View {
    let user : User
    @State private var showingSheet = false
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack {
                ZStack {
                    Image(user.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(Color.white, lineWidth: 5))
                        .padding(5)
                    
                    Text(user.name)
                        .font(.caption)
                        .foregroundColor(.white)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 80, alignment: .bottom)
                        .padding(.top, 40)
                    
                    Button(action: {
                        showingSheet.toggle()
                        
                    }, label: {
                        Image(systemName: "gearshape")
                            .foregroundColor(.white)
                            .frame(width: 90, height: 120, alignment: .topTrailing)
                    }
                    ).sheet(isPresented: $showingSheet) {
                        TestView()
                    }
                }
            }
            
            
            
            .frame(width: 320, height: 130,alignment: .trailing)
            //SelectionView()
        }
        .background(LinearGradient(Color.darkBlueStart, Color.darkBlueEnd))
        .edgesIgnoringSafeArea(.top)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: user1)
    }
}
