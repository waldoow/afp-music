//
//  SearchBar.swift
//  music.fresh
//
//  Created by mac32 on 15/06/2021.
//
import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    @State private var isEditing = false
    var body: some View {
        HStack {
            TextField("Titres, playlists ou artistes", text: $text)
                .padding(8)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(13)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(.systemGray2))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                        
                        if isEditing{
                            Button(action: {
                                isEditing = false
                                self.text = ""
                            }, label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            })
                            .animation(.easeInOut(duration: 2).delay(2))
                        }
                    }
                ).onTapGesture {
                    self.isEditing = true
                }

            if isEditing {
                Button(action: {
                    self.isEditing = false
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }){
                    Text("Annuler")
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.easeInOut(duration: 2).delay(2))
                }
            }
        }
        .padding(10)
    }
}
