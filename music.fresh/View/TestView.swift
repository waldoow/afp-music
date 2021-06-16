//
//  TestView.swift
//  music.fresh
//
//  Created by lucie on 15/06/2021.
//

import SwiftUI

struct TestView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button("valider") {
            presentationMode.wrappedValue.dismiss()
        }
        .font(.title)
        .padding()
        .background(Color.black)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
