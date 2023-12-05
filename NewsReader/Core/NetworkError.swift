//
//  NetworkError.swift
//
//  Created by Paritosh on 26/11/23.
//

import Foundation

// MARK: - ANRNetworkError
///  This is generic error response when API call fails
public enum NetworkError: LocalizedError  {
    
    case invalidServerResponse
    case invalidURL
    
    public var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            return NetworkErrorConstants.invalidServerResponse
        case .invalidURL:
            return NetworkErrorConstants.invalidURL
        }
    }
}

