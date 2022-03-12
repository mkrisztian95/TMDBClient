//
//  SearchApi.swift
//  TMDBClient
//
//  Created by Chris on 12.03.2022.
//

import Foundation
import Alamofire
import BrightFutures
import ObjectMapper

class SearchAPI: APIClientManager, BaseApiProtocol {
    var method: HTTPMethod = .get

    var path: String = APIEndpoints.searchApiEndpoint

    var parameters: [String: AnyObject]? = [ParameterKeys.Token.tokenKey: EnvironmentVars.apiToken] as [String: AnyObject]

    func performSearchRequest(with value: String) -> Future<Any, Error> {
        parameters?[ParameterKeys.Search.query] = value as AnyObject
        return getData(path, params: parameters, method: .get, encoding: PartnersEncoding())
    }
}
