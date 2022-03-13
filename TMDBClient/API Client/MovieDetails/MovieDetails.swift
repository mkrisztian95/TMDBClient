//
//  MovieDetails.swift
//  TMDBClient
//
//  Created by Chris on 13.03.2022.
//

import Foundation
import Alamofire
import BrightFutures
import ObjectMapper

class MovieDetilsApi: APIClientManager, BaseApiProtocol {
    let movieId: Int

    init(movieId: Int) {
        self.movieId = movieId
    }

    var method: HTTPMethod = .get

    var path: String {
        return APIEndpoints.movieDetails(id: movieId)
    }

    var parameters: [String: AnyObject]? = [
        ParameterKeys.Token.tokenKey: EnvironmentVars.apiToken,
        ParameterKeys.General.language: "en-US"
    ] as [String: AnyObject]

    func getMovieDetails() -> Future<MovieDetailsModel, Error> {
        return getObject(path, params: parameters, method: method, encoding: PartnersEncoding())
    }
}
