//
//  APIManager+Search.swift
//  TMDBClient
//
//  Created by Chris on 12.03.2022.
//

import Foundation
import Alamofire
import BrightFutures
import ObjectMapper

public protocol BaseApiProtocol {

    typealias HTTPMethod = Alamofire.HTTPMethod
    /**
     Method for service
     */
    var method: HTTPMethod { get }

    /**
     Path for service
     */
    var path: String { get }

    /**
     Parameters for service
     */
    var parameters: [String: AnyObject]? { get }
}
