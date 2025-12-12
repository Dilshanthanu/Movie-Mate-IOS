//
//  SearchMovie.swift
//  MovieMate
//
//  Created by Dilshan Thanushka on 2025-11-20.
//

import Foundation

struct SearchMovies: Codable {
    let search: [MovieSummary]?
    let totalResults: String?
    let response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults = "totalResults"
        case response = "Response"
    }
}

struct MovieSummary: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

extension MovieSummary {
    static let sample = MovieSummary(
        title: "Avatar",
        year: "2009",
        imdbID: "tt0499549",
        type: "movie",
        poster: "https://m.media-amazon.com/images/M/MV5BM2JiZjU1NmQtNjg1Ni00NjA3LTk2MjMtNjYxMTgxODY0NjRhXkEyXkFqcGc@._V1_SX300.jpg"
    )
}
