//
//  SearchResultWrapper.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import Foundation
import Alamofire
import BrightFutures
import ObjectMapper

struct SearchResultWrapper: CRUDObject {
    var page: Int?
    var results: [SearchItemModel]?

    init?(map: Map) {
        mapping(map: map)
    }

    mutating func mapping(map: Map) {
        page <- map["page"]
        results <- map["results"]
    }
}
