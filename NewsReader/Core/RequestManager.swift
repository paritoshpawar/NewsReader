//
//  RequestManager.swift
//
//  Created by Paritosh on 26/11/23.
//

import Foundation

protocol RequestManagerProtocol {
    func fetchData<T: Codable>(urlRequest: URLRequest) async throws -> T
}

class NetworkManagerService : RequestManagerProtocol {
    
    var session: URLSession = URLSession(configuration: .default)
    
    func fetchData<T: Codable>(urlRequest: URLRequest) async throws -> T {
                
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidURL
        }
        
        guard httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.invalidServerResponse
        }
    }
}
