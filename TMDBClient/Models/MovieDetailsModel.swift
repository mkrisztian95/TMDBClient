//
//  MovieDetailsModel.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import Foundation
import Alamofire
import BrightFutures
import ObjectMapper

struct MovieDetailsModel: CRUDObject {
    var title: String?
    var popularity: Double?
    var poster: String?
    var productions: [Productions]?
    var releaseDate: String?
    var revenue: Double?
    var vote: Double?
    var budget: Int?
    var overView: String?

    init?(map: Map) {
        mapping(map: map)
    }

    mutating func mapping(map: Map) {
        title <- map["title"]
        popularity <- map["popularity"]
        poster <- map["poster_path"]
        productions <- map["production_companies"]
        releaseDate <- map["release_date"]
        revenue <- map["revenue"]
        vote <- map["vote_average"]
        budget <- map["budget"]
        overView <- map["overview"]
    }
}

struct Productions: CRUDObject {
    var name: String?

    init?(map: Map) {
        mapping(map: map)
    }

    mutating func mapping(map: Map) {
        name <- map["name"]
    }
}
