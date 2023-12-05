//
//  NewsDashboardViewModel.swift
//  NewsReader
//
//  Created by Paritosh on 05/12/23.
//

import Foundation

@MainActor
final class NewsDashboardViewModel : ObservableObject {
    
    @Published var newsList : [Article] = []
    @Published var errorMessage: String = ""
    @Published var errorOccured: Bool = false
    
    private let getTopHeadlineServiceObject: FetchTopHeadlinesServiceProtocol
    
    init(getHeadlinesObject: FetchTopHeadlinesServiceProtocol) {
        self.getTopHeadlineServiceObject = getHeadlinesObject
    }
    
    func getTopHeadlines() async {
        
        let result = await getTopHeadlineServiceObject.getTopHeadlines()
        
        switch result {
        case .success(let model):
            newsList = model.articles
            
        case .failure(let error):
            errorOccured = true
            errorMessage = error.localizedDescription
        }
    }
}
