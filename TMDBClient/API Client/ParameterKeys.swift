//
//  ParameterKeys.swift
//  TMDBClient
//
//  Created by Chris on 12.03.2022.
//

import Foundation

struct ParameterKeys {
    struct General {
        static let language = "language"
    }

    struct Token {
        static let tokenKey = "api_key"
    }

    struct Search {
        static let query = "query"
        static let page = "page"
    }
}
