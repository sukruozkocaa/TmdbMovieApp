//
//  Movie.swift
//  Netflix Clone
//
//  Created by Şükrü Özkoca on 1.11.2022.
//

import Foundation

struct TrendingTitleResponse: Codable{
    let results: [Title]
}

struct Title : Codable{
    let backdropPath: String?
    let mediaType: String?
    let id: Int
    let title: String?
    let originalTitle: String?
    let overview, posterPath: String?
    let popularity: Double
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
    let name, originalName, firstAirDate: String?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id, title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case mediaType = "media_type"
    }
}
