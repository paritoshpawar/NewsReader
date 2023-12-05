//
//  NewsDetailsView.swift
//  NewsReader
//
//  Created by Paritosh on 05/12/23.
//

import SwiftUI

struct NewsDetailsView: View {
    
    var articleData : Article
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
        
                    AsyncImage(url: URL(string: articleData.urlToImage ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .cornerRadius(20)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 40, height: 40)
                    }
                    
                    Text(articleData.title ?? "")
                        .font(.headline)
                        .padding(.bottom)
                    
                    Text(articleData.content ?? "")
                        .font(.callout)
                        .padding(.bottom)
                    
                    Link("Read this news in detail", destination: URL(string: articleData.url ?? "")!)

                    
                }
            }
            .navigationTitle("News Details")
            .padding(.all
            )
        }
    }
}

struct NewsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
                
        NewsDetailsView(articleData: Article(source: Source(name: ""),
                                             author: "",
                                             title: "",
                                             description: "",
                                             url: "",
                                             urlToImage: "",
                                             publishedAt: "",
                                             content: ""))
    }
}
