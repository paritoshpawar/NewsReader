//
//  GetTopHeadlinesRequest.swift
//
//  Created by Paritosh on 27/11/23.
//


import Foundation

enum GetTopHeadlinesRequest : RequestProtocol {
    
    case getTopHeadlinesWith(country: String, key: String)
    
    var base: String { APIURLConstants.baseURL}
    
    var path: String { APIURLConstants.pathURL }
        
    var urlParams: [String : String?] {
        switch self {
        case let .getTopHeadlinesWith(country, key) :
            var params: [String: String] = [:]

            if !country.isEmpty { params["country"] = country }
            if !key.isEmpty { params["apiKey"] = key }
            return params
        }
    }
    
    var requestType: RequestType { .GET }
}
