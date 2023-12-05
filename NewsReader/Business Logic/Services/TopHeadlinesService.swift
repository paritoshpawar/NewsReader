//
//  TopHeadlinesService.swift
//  TopHeadlinesService
//
//  Created by Paritosh on 27/11/23.
//

import Foundation

protocol FetchTopHeadlinesServiceProtocol {
    func getTopHeadlines() async -> Result<TopHeadlinesModel, NetworkError>
}

struct TopHeadlinesService {
    
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

extension TopHeadlinesService : FetchTopHeadlinesServiceProtocol {
    
    
    func getTopHeadlines() async -> Result<TopHeadlinesModel, NetworkError> {
        let requestData = GetTopHeadlinesRequest.getTopHeadlinesWith(country: "in", key: "191436be3e37445f809d525832b3702a")
        do {
            return .success(try await requestManager.fetchData(urlRequest: requestData.createURLRequest()))
        }catch {
            return .failure(error as? NetworkError ?? NetworkError.invalidServerResponse)
        }
    }
}
