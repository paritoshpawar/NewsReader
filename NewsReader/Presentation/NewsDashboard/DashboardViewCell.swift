//
//  DashboardViewCell.swift
//  NewsReader
//
//  Created by Paritosh on 05/12/23.
//

import SwiftUI

struct DashboardViewCell: View {
    
    let articleData : Article
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.linearGradient(colors: [Color(.systemGray5), Color(.lightGray)], startPoint: .leading, endPoint: .trailing))
                .opacity(0.9)
                .frame(height: 160)
            
            HStack {
                AsyncImage(url: URL(string: articleData.urlToImage ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipped()
                        .cornerRadius(25)
                } placeholder: {
                    ProgressView()
                        .frame(width: 40, height: 40)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(articleData.title ?? "")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    HStack(spacing: 8) {
                        Text(articleData.description ?? "")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .lineLimit(2)
                    }
                    HStack(spacing: 8) {
                        Text(articleData.publishedAt ?? "")
                            .foregroundColor(.black)
                    }
                }
                .font(.system(size: 14))
                .padding()
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .leading
                )
                Spacer()
            }
            .frame(height: 160)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        
    }
}

struct DashboardViewCell_Previews: PreviewProvider {
    static var previews: some View {
        DashboardViewCell(articleData: Article(source: Source(name: ""),
                                               author: "",
                                               title: "",
                                               description: "",
                                               url: "",
                                               urlToImage: "",
                                               publishedAt: "",
                                               content: ""))
    }
}
