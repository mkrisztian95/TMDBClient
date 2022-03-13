//
//  APIContants.swift
//  TMDBClient
//
//  Created by Chris on 12.03.2022.
//

import Foundation

struct APIEndpoints {
    static let searchApiEndpoint = "/search/movie"

    static func movieDetails(id: Int) -> String {
        return "/movie/\(id)"
    }
}

struct URLs {
    static let assetURL = "https://image.tmdb.org/t/p/w500"
}
