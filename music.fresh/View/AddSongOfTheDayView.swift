//
//  AddSongOfTheDayView.swift
//  music.fresh
//
//  Created by SPGJ on 16/06/2021.
//

import SwiftUI

struct AddSongOfTheDayView: View {
    
    @State var name: String
    @State var title: String
    @State var url: String
    @State var year: String
    @State var description: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .leading)

            HStack {
                Text("Nom :")
                TextField("Nom", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                Text("Titre :")
                TextField("Titre", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                Text("URL :")
                TextField("URL", text: $url)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack{
                Text("Année :")
                TextField("Année", text: $year)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                Text("Biographie :")
                TextField("", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

        }
        .padding()
    }
}

struct AddSongOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        AddSongOfTheDayView(name: "Halestorm", title: "Do Not Disturb", url: "https://www.youtube.com/watch?v=WZNb8A48USo", year: "2018", description: "Halestorm est un groupe de heavy metal américain, originaire de York, en Pennsylvanie. Le groupe est actuellement signé chez Atlantic Records et a réalisé son premier album éponyme en avril 2009. Suit The Strange Case of... en 2012, dont le premier single, Love Bites (So Do I), qui est récompensé d'un Grammy Award dans la catégorie de la meilleure chanson hard rock/metal, le 10 février 20135,6. En 2015 sort l'album Into the Wild Life. Et en 2018 le groupe sort l'album Vicious, avec le single Uncomfortable qui est nommé au Grammy Award dans la catégorie meilleure prestation rock. Ils ont également sorti plusieurs EP, notamment des albums de reprises.")
    }
}
