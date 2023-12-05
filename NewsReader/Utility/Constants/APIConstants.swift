//
//  APIConstants.swift
//
//  Created by Paritosh on 26/11/23.
//

import Foundation

struct APIURLConstants {
    static let URLScheme                       = "https"
    static let authorizationKey                = "Authorization"
    static let contentTypeKey                  = "accept"
    static let contentTypeValue                = "application/json"
    static let baseURL                         = "newsapi.org"
    static let pathURL                         = "/v2/top-headlines"
}

struct NetworkErrorConstants {
    static let invalidServerResponse             = "Unexpected error occured"
    static let invalidURL                        = "URL string is malformed."
}

struct UIConstants {
    static let navigationTitle = "News"
}
