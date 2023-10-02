//
//  Poster.swift
//  lab-tunley
//
//  Created by Cesar Vargas on 10/1/23.
//

import Foundation

struct PosterSearchResponse: Decodable {
    let results: [Poster]
}

struct Poster: Decodable {
    let title: String
    let overview: String
    let popularity: Double
    let vote_average: Double
    let vote_count: Int
    var poster_path: URL
}
