//
//  Data.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import Foundation

let song1 = Song(title: "Titre1", artist: "Artiste", description: "Album", imageName: "imageSong", url: "", year: 2021)
let song2 = Song(title: "Titre2", artist: "Artiste", description: "Album", imageName: "imageSong", url: "", year: 2021)
let song3 = Song(title: "Titre3", artist: "Artiste", description: "Album", imageName: "imageSong", url: "", year: 2021)
let songsList = [song1, song2, song3]


let playlist1 = Playlist(title: "Playlist1", user: "User", imageName: "imagePlaylist", year: 2021, songs: songsList)
let playlist2 = Playlist(title: "Playlist2", user: "User", imageName: "imagePlaylist", year: 2021, songs: songsList)
let playlist3 = Playlist(title: "Playlist3", user: "User", imageName: "imagePlaylist", year: 2021, songs: songsList)
let playlistsList = [playlist1, playlist2, playlist3]


let artist1 = Artist(name: "Klem Schen", imageName: "KlemPhoto", description: "Clément Chotteau AKA Klem Schen est un jeune rappeur originaire d’Aix en Provence (13), né en Décembre 2001. Très productif dès ses débuts avec son propre label KlemLabel, il sort ses trois premiers projets en l’espace d’un mois seulement (Blanc au noir, Sommeil, puis Lueurs) au début de l’année 2019.")
let artist2 = Artist(name: "Carbonne", imageName: "CarbonnePhoto", description: "Clément Chotteau AKA Klem Schen est un jeune rappeur originaire d’Aix en Provence (13), né en Décembre 2001. Très productif dès ses débuts avec son propre label KlemLabel, il sort ses trois premiers projets en l’espace d’un mois seulement (Blanc au noir, Sommeil, puis Lueurs) au début de l’année 2019.")
let artist3 = Artist(name: "Carbonne", imageName: "CarbonnePhoto", description: "Clément Chotteau AKA Klem Schen est un jeune rappeur originaire d’Aix en Provence (13), né en Décembre 2001. Très productif dès ses débuts avec son propre label KlemLabel, il sort ses trois premiers projets en l’espace d’un mois seulement (Blanc au noir, Sommeil, puis Lueurs) au début de l’année 2019.")
let artistsList = [artist1, artist2, artist3]


let user1 = User(name: "User1", imageName: "", recentSongs: songsList, myPlaylists: playlistsList)
let user2 = User(name: "User2", imageName: "", recentSongs: songsList, myPlaylists: playlistsList)
let user3 = User(name: "User3", imageName: "", recentSongs: songsList, myPlaylists: playlistsList)
let usersList = [user1, user2, user3]


let vote1 = Vote(positiveVote: 300, negativeVote: 200)
let vote2 = Vote(positiveVote: 406, negativeVote: 232)
let vote3 = Vote(positiveVote: 674, negativeVote: 455)
let vote4 = Vote(positiveVote:932, negativeVote: 129)
let vote5 = Vote(positiveVote: 234, negativeVote: 518)
