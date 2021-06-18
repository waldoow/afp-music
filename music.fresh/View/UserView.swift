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
        self.init(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing)
    }
}

struct UserView: View {
    let user : User
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("selectionView")
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(LinearGradient(Color.lightBlueEnd, Color.lightBlueStart))
            .navigationBarItems(
                leading:
                    Text(user.name)
                    .font(.body)
                    .foregroundColor(Color(.systemTeal)),
                
                trailing:
                    HStack {
                        Button(action: {
                            showingSheet.toggle()
                            
                        }, label: {
                            Image(systemName: "gearshape")
                                .foregroundColor(.lightBlueEnd)
                        }
                        ).sheet(isPresented: $showingSheet) {
                            ProfileUpdateForm()
                        }
                        
                        Image(user.imageName ?? "")
                            .resizable()
                            .frame(width: 60, height: 100)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                            .overlay(Circle().stroke(Color.lightBlueEnd, lineWidth: 5))
                    }
            )
            .edgesIgnoringSafeArea(.top)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: user1)
    }
}
