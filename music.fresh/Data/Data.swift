//
//  Data.swift
//  music.fresh
//
//  Created by mac32 on 14/06/2021.
//

import Foundation
import SwiftUI

let song1 = Song(title: "Néant", artist: artist1, description: "Néant écrit par Carbonne est une musique hors album sorti le 19 Janvier 2021", imageName: "carbonnephoto", url: "", year: 2021)
let song2 = Song(title: "YO! MY SAINT", artist: artist2, description: "Bande son original de la série 'Ragnarok'", imageName: "yomysaint", url: "", year: 2018)
let song3 = Song(title: "Autre monde !", artist: artist3, description: "Autre monde écrit par Klem, est une musique hors album sorti le 19 Janvier 2021. L'instrumental fût composée par Maxime.P", imageName: "autremonde", url: "", year: 2021)
var songsList = [song1, song2, song3].shuffled()


let playlist1 = Playlist(title: "Chill/Lofi", user: "User", imageName: UIImage(named: "lofi"), year: 2021, songs: songsList)
let playlist2 = Playlist(title: "Soul/Jazz", user: "User", imageName: UIImage(named: "souljazz"), year: 2021, songs: songsList)
let playlist3 = Playlist(title: "Rap FR", user: "User", imageName: UIImage(named: "rapfr"), year: 2021, songs: songsList)
var playlistsList = [playlist1, playlist2, playlist3].shuffled()


let artist1 = Artist(name: "Carbonne", imageName: "carbonnephoto", description: "Carbonne est un jeune rappeur. Il possède trois albums. ")
let artist2 = Artist(name: "Karen.O", imageName: "kareno", description: "Karen Lee Orzolek, née le 22 novembre 1978 à Busan, plus connue sous son nom de scène Karen O, est la chanteuse du groupe de musique new-yorkais Yeah Yeah Yeahs. Elle a également composé des bandes originales de films, comme celle de Max et les Maximonstres du réalisateur Spike Jonze.")
let artist3 = Artist(name: "Klem Schen", imageName: "KlemPhoto", description: "Clément Chotteau AKA Klem Schen est un jeune rappeur originaire d’Aix en Provence (13), né en Décembre 2001. Très productif dès ses débuts avec son propre label KlemLabel, il sort ses trois premiers projets en l’espace d’un mois seulement (Blanc au noir, Sommeil, puis Lueurs) au début de l’année 2019.")
var artistsList = [artist1, artist2, artist3].shuffled()

let user1 = User(name: "Bilbo Baggins", email: "bilbobaggins@gmail.com" ,imageName: "user1.jpg", password: "baggins", recentSongs: songsList, myPlaylists: playlistsList, isFavorite: true)
let user2 = User(name: "Arwen Undomiel", email: "arwenundomiel@gmail.com", imageName: "user2.jpg", password: "undomiel",  recentSongs: songsList, myPlaylists: playlistsList, isFavorite: true)
let user3 = User(name: "Pippin Took", email: "pippintook@gmail.com", imageName: "user3.jpg", password: "pippin", recentSongs: songsList, myPlaylists: playlistsList, isFavorite:  true)
var usersList = [user1, user2, user3]
var currentUser: User? = nil


let vote1 = Vote(user: user1, positiveVote: 300, negativeVote: 200, comment: "Bonsoir, j'ai entendu ça, je l'ai trouver pas mal, je vous la partage.")
let vote2 = Vote(user: user2, positiveVote: 406, negativeVote: 232, comment: "Bonjour, je vous propose d'écouter cette chanson, elle est super.")
let vote3 = Vote(user: user3, positiveVote: 674, negativeVote: 455, comment: "Bon pas sûr que vous allez appréciez mais j'ai accrocher.")
let vote4 = Vote(user: user1, positiveVote:932, negativeVote: 129, comment: "Bonjour, je vous propose d'écouter cette chanson, elle est top.")
let vote5 = Vote(user: user2, positiveVote: 234, negativeVote: 518, comment: "Bonjour, je vous propose d'écouter cette chanson, elle est géniale.")

let voteList = [vote1, vote2, vote3, vote4, vote5]
