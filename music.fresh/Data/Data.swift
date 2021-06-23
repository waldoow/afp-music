//
//  Data.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import Foundation
import SwiftUI

let song1 = Song(title: "Titre1", artist: artist1, description: "Album", imageName: "imageSong", url: "", year: 2021)
let song2 = Song(title: "Titre2", artist: artist1, description: "Album", imageName: "imageSong", url: "", year: 2021)
let song3 = Song(title: "Titre3", artist: artist1, description: "Album", imageName: "imageSong", url: "", year: 2021)
let song4 = Song(title: "Halestorm", artist: artist4, description: "The Strange Case Of...", imageName: "Halestorm", url: "", year: 2012)
var songsList = [song1, song2, song3].shuffled()


let playlist1 = Playlist(title: "Playlist1", user: "User", imageName: UIImage(named: "imagePlaylist"), year: 2021, songs: songsList)
let playlist2 = Playlist(title: "Playlist2", user: "User", imageName: UIImage(named: "imagePlaylist"), year: 2021, songs: songsList)
let playlist3 = Playlist(title: "Playlist3", user: "User", imageName: UIImage(named: "imagePlaylist"), year: 2021, songs: songsList)
var playlistsList = [playlist1, playlist2, playlist3].shuffled()


let artist1 = Artist(name: "Klem Schen", imageName: "KlemPhoto", description: "Clément Chotteau AKA Klem Schen est un jeune rappeur originaire d’Aix en Provence (13), né en Décembre 2001. Très productif dès ses débuts avec son propre label KlemLabel, il sort ses trois premiers projets en l’espace d’un mois seulement (Blanc au noir, Sommeil, puis Lueurs) au début de l’année 2019.")
let artist2 = Artist(name: "Carbonne", imageName: "KlemPhoto", description: "Clément Chotteau AKA Klem Schen est un jeune rappeur originaire d’Aix en Provence (13), né en Décembre 2001. Très productif dès ses débuts avec son propre label KlemLabel, il sort ses trois premiers projets en l’espace d’un mois seulement (Blanc au noir, Sommeil, puis Lueurs) au début de l’année 2019.")
let artist3 = Artist(name: "Carbonne", imageName: "KlemPhoto", description: "Clément Chotteau AKA Klem Schen est un jeune rappeur originaire d’Aix en Provence (13), né en Décembre 2001. Très productif dès ses débuts avec son propre label KlemLabel, il sort ses trois premiers projets en l’espace d’un mois seulement (Blanc au noir, Sommeil, puis Lueurs) au début de l’année 2019.")
let artist4 = Artist(name: "Halestorm", imageName: "Halestorm", description: "Halestorm est un groupe de heavy metal américain, originaire de York, en Pennsylvanie. Le groupe est actuellement signé chez Atlantic Records et a réalisé son premier album éponyme en avril 2009. Suit The Strange Case of... en 2012, dont le premier single, Love Bites (So Do I), qui est récompensé d'un Grammy Award dans la catégorie de la meilleure chanson hard rock/metal, le 10 février 2013. En 2015 sort l'album Into the Wild Life. Et en 2018 le groupe sort l'album Vicious, avec le single Uncomfortable qui est nommé au Grammy Award dans la catégorie meilleure prestation rock. Ils ont également sorti plusieurs EP, notamment des albums de reprises.")
var artistsList = [artist1, artist2, artist3].shuffled()

let user1 = User(name: "Bilbo Baggins", email: "bilbobaggins@gmail.com" ,imageName: "user1.jpg", password: "baggins", recentSongs: songsList, myPlaylists: playlistsList)
let user2 = User(name: "Arwen Undomiel", email: "arwenundomiel@gmail.com", imageName: "user2.jpg", password: "undomiel", recentSongs: songsList, myPlaylists: playlistsList)
let user3 = User(name: "Pippin Took", email: "pippintook@gmail.com", imageName: "user3.jpg", password: "pippin", recentSongs: songsList, myPlaylists: playlistsList)
var usersList = [user1, user2, user3]
var currentUser: User? = nil


let vote1 = Vote(user: user1, positiveVote: 300, negativeVote: 200, comment: "Bonjour, je vous propose d'écouter cette chanson, elle est incroyable.")
let vote2 = Vote(user: user2, positiveVote: 406, negativeVote: 232, comment: "Bonjour, je vous propose d'écouter cette chanson, elle est super.")
let vote3 = Vote(user: user3, positiveVote: 674, negativeVote: 455, comment: "Bonjour, je vous propose d'écouter cette chanson, elle est ouf.")
let vote4 = Vote(user: user1, positiveVote:932, negativeVote: 129, comment: "Bonjour, je vous propose d'écouter cette chanson, elle est top.")
let vote5 = Vote(user: user2, positiveVote: 234, negativeVote: 518, comment: "Bonjour, je vous propose d'écouter cette chanson, elle est géniale.")

let voteList = [vote1, vote2, vote3, vote4, vote5]
