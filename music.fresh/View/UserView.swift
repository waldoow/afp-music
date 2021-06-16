//
//  UserView.swift
//  music.fresh
//
//  Created by lucie on 14/06/2021.
//

import SwiftUI

extension Color {
    static let lightBlueStart = Color(red: 109 / 255, green: 213 / 255, blue: 250 / 255)
    static let lightBlueEnd = Color(red: 41 / 255, green: 128 / 255, blue: 185 / 255)
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
        NavigationView {
            GeometryReader { proxy in
                //SelectionView()
            }
            .background(LinearGradient(Color.lightBlueStart, Color.lightBlueEnd))
            .navigationBarItems(
                leading:
                    Text(user.name)
                    .font(.body)
                    .foregroundColor(Color(.systemGray)),
                
                trailing:
                    HStack {
                        Button(action: {
                            showingSheet.toggle()
                            
                        }, label: {
                            Image(systemName: "gearshape")
                                .foregroundColor(.gray)
                        }
                        ).sheet(isPresented: $showingSheet) {
                            ProfileView()
                        }
                        
                        Image(user1.imageName ?? "")
                            .resizable()
                            .frame(width: 60, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .overlay(Circle().stroke(Color.gray, lineWidth: 5))
                    }
            )
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: user1)
    }
}
