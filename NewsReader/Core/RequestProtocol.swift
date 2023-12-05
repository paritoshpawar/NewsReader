//
//  RequestProtocol.swift
//
//  Created by Paritosh on 26/11/23.
//

import Foundation

// MARK: RequestProtocol : Use this protocol to create URLRequest
///
/// base                                : Host / Base URL for Rest endpoint.
/// path:                               : Path URL for Rest endpoint.
/// headers                          : Headers for the REST endpoint
/// params                           : Body Params in the endpoint
/// urlParams                       : Query params for endpoins
/// addAuthorizationToken   : Required token for the endpoint
/// requestType                    : [GET, POST, PUT, DELETE]
///
/// Implement RequestProtocol to provide the details
protocol RequestProtocol {
    
    var base: String { get }
    var path: String { get }
    var headers: [String: String] { get }
    var params: [String: Any] { get }
    var urlParams: [String: String?] { get }
    var addAuthorizationToken: Bool { get }
    var requestType: RequestType { get }
}

extension RequestProtocol {
    
    var addAuthorizationToken: Bool { true }
    var params: [String: Any] { [:] }
    var urlParams: [String: String?] { [:] }
    var headers: [String: String] { [:] }
    
    func createURLRequest() throws -> URLRequest {
        
        var components = URLComponents()
        components.scheme = APIURLConstants.URLScheme
        components.host = base
        components.path = path
        
        if !urlParams.isEmpty {
            components.queryItems = urlParams.map {
                URLQueryItem(name: $0, value: $1)
            }
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        guard let url = components.url
        else { throw NetworkError.invalidURL }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data( withJSONObject: params)
        }

        return urlRequest
    }
}
