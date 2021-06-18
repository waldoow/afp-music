//
//  Data.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import Foundation

let song1 = Song(title: "Titre1", artist: artist1, description: "Album", imageName: "imageSong", url: "", year: 2021)
let song2 = Song(title: "Titre2", artist: artist1, description: "Album", imageName: "imageSong", url: "", year: 2021)
let song3 = Song(title: "Titre3", artist: artist1, description: "Album", imageName: "imageSong", url: "", year: 2021)
var songsList = [song1, song2, song3]


let playlist1 = Playlist(title: "Playlist1", user: "User", imageName: "imagePlaylist", year: 2021, songs: songsList)
let playlist2 = Playlist(title: "Playlist2", user: "User", imageName: "imagePlaylist", year: 2021, songs: songsList)
let playlist3 = Playlist(title: "Playlist3", user: "User", imageName: "imagePlaylist", year: 2021, songs: songsList)
var playlistsList = [playlist1, playlist2, playlist3]


let artist1 = Artist(name: "Klem Schen", imageName: "KlemPhoto", description: "Clément Chotteau AKA Klem Schen est un jeune rappeur originaire d’Aix en Provence (13), né en Décembre 2001. Très productif dès ses débuts avec son propre label KlemLabel, il sort ses trois premiers projets en l’espace d’un mois seulement (Blanc au noir, Sommeil, puis Lueurs) au début de l’année 2019.")
let artist2 = Artist(name: "Carbonne", imageName: "KlemPhoto", description: "Clément Chotteau AKA Klem Schen est un jeune rappeur originaire d’Aix en Provence (13), né en Décembre 2001. Très productif dès ses débuts avec son propre label KlemLabel, il sort ses trois premiers projets en l’espace d’un mois seulement (Blanc au noir, Sommeil, puis Lueurs) au début de l’année 2019.")
let artist3 = Artist(name: "Carbonne", imageName: "KlemPhoto", description: "Clément Chotteau AKA Klem Schen est un jeune rappeur originaire d’Aix en Provence (13), né en Décembre 2001. Très productif dès ses débuts avec son propre label KlemLabel, il sort ses trois premiers projets en l’espace d’un mois seulement (Blanc au noir, Sommeil, puis Lueurs) au début de l’année 2019.")
var artistsList = [artist1, artist2, artist3]

let user1 = User(name: "Bilbo Baggins", email: "bilbobaggins@gmail.com" ,imageName: "user1.jpg", recentSongs: songsList, myPlaylists: playlistsList)
let user2 = User(name: "Arwen Undomiel", email: "arwenundomiel@gmail.com", imageName: "user2.jpg", recentSongs: songsList, myPlaylists: playlistsList)
let user3 = User(name: "Pippin Took", email: "pippintook@gmail.com", imageName: "user3.jpg", recentSongs: songsList, myPlaylists: playlistsList)
var usersList = [user1, user2, user3]
var currentUser: User? = nil

