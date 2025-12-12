//
//  Movie.swift
//  MovieMate
//
//  Created by Dilshan Thanushka on 2025-11-19.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: String
    let rated: String
    let runtime: String
    let genre: String
    let director: String
    let writer: String
    let actors: String
    let plot: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
    }
}
