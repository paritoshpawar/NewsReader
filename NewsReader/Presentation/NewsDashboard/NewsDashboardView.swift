//
//  NewsDashboardView.swift
//  NewsReader
//
//  Created by Paritosh on 04/12/23.
//

import SwiftUI

struct NewsDashboardView: View {
    
    @StateObject var newsListVM = NewsDashboardViewModel(getHeadlinesObject: TopHeadlinesService(requestManager: NetworkManagerService()))
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(newsListVM.newsList, id: \.title) { item in
                    NavigationLink(destination: NewsDetailsView(articleData: item)) {
                        DashboardViewCell(articleData: item)
                    }
                }
            }
            .background(.white)
            .navigationTitle(UIConstants.navigationTitle)
            .navigationBarTitleDisplayMode(.automatic)
        }
        .task {
            await newsListVM.getTopHeadlines()
        }
        
    }
}

struct NewsDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDashboardView()
    }
}
