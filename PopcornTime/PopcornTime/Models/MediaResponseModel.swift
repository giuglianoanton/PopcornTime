//
//  MediaResponseModel.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 27/03/23.
//

import Foundation

struct Results: Codable{
    var results: [Media]
}

struct Media: Codable {
    let adult: Bool
    let backdrop_path: String
    let id: Int
    let title: String?
    let original_language: String?
    let original_title: String?
    let overview, poster_path: String
    let media_type: MediaType
    let genre_ids: [Int]
    let popularity: Double
    let release_date: String?
    let video: Bool?
    let vote_average: Double
    let vote_count: Int
    let name, original_name, first_air_date: String?
    let origin_country: [String]?
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case ko = "ko"
}
