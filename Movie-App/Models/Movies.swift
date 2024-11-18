//
//  Movies.swift
//  Movie-App
//
//  Created by Adrien BONVALLET on 02/10/2024.
//

import Foundation

struct MovieResponse: Codable {
    var page: Int
    var results: [Movie]
    var total_pages: Int
}

struct Movie: Identifiable, Codable {
    var id: Int
    var original_title: String
    var original_language: String
    var overview: String
    var title: String
    var release_date: String
    var poster_path: String
    var popularity: Double
    var vote_average: Double
    var vote_count: Int
}

extension Movie {
    static let sampleData: [Movie] = [Movie(id: 533535, original_title: "Deadpool & Wolverine", original_language: "en", overview: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.", title: "Deadpool & Wolverine", release_date: "2024-07-24", poster_path: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg", popularity: 4898.846, vote_average: 7.749, vote_count: 3847), Movie_App.Movie(id: 519182, original_title: "Despicable Me 4", original_language: "en", overview: "Gru and Lucy and their girls—Margo, Edith and Agnes—welcome a new member to the Gru family, Gru Jr., who is intent on tormenting his dad. Gru also faces a new nemesis in Maxime Le Mal and his femme fatale girlfriend Valentina, forcing the family to go on the run.", title: "Despicable Me 4", release_date: "2024-06-20", poster_path: "/wWba3TaojhK7NdycRhoQpsG0FaH.jpg", popularity: 1821.154, vote_average: 7.165, vote_count: 1855), Movie_App.Movie(id: 889737, original_title: "Joker: Folie à Deux", original_language: "en", overview: "While struggling with his dual identity, Arthur Fleck not only stumbles upon true love, but also finds the music that\'s always been inside him.", title: "Joker: Folie à Deux", release_date: "2024-10-01", poster_path: "/aciP8Km0waTLXEYf5ybFK5CSUxl.jpg", popularity: 1661.893, vote_average: 6.065, vote_count: 246), Movie_App.Movie(id: 1114513, original_title: "Speak No Evil", original_language: "en", overview: "When an American family is invited to spend the weekend at the idyllic country estate of a charming British family they befriended on vacation, what begins as a dream holiday soon warps into a snarled psychological nightmare.", title: "Speak No Evil", release_date: "2024-09-11", poster_path: "/fDtkrO2OAF8LKQTdzYmu1Y7lCLB.jpg", popularity: 1615.186, vote_average: 7.224, vote_count: 398), Movie_App.Movie(id: 1022789, original_title: "Inside Out 2", original_language: "en", overview: "Teenager Riley\'s mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation by all accounts, aren’t sure how to feel when Anxiety shows up. And it looks like she’s not alone.", title: "Inside Out 2", release_date: "2024-06-11", poster_path: "/vpnVM9B6NMmQpWeZvzLvDESb2QY.jpg", popularity: 1248.937, vote_average: 7.645, vote_count: 4094)]
}
