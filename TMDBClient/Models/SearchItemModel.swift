//
//  SearchItemModel.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import Foundation
import Alamofire
import BrightFutures
import ObjectMapper

struct SearchItemModel: CRUDObject {
    var adult: Bool?
    var overview: String?
    var popularity: Double?
    var poster: String?
    var backdrop: String?
    var releaseDate: String?
    var language: String?
    var title: String?
    var originalTitle: String?
    var vote: Double?
    var id: Int?

    init?(map: Map) {
        mapping(map: map)
    }

    mutating func mapping(map: Map) {
        adult <- map["adult"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        backdrop <- map["backdrop_path"]
        poster <- map["poster_path"]
        releaseDate <- map["release_date"]
        title <- map["title"]
        vote <- map["vote_average"]
        language <- map["original_language"]
        originalTitle <- map["original_title"]
        id <- map["id"]
    }
}
