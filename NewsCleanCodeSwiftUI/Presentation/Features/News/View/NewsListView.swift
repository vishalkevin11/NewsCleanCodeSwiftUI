//
//  NewsListView.swift
//  NewsCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 09/02/23.
//

import Combine
import SwiftUI

struct NewsListView: View {
    @StateObject var newsListViewModel  = NewsListViewModel()
    var body: some View {
        contentView()
    }
    
    @ViewBuilder
    func contentView() -> some View {
        switch newsListViewModel.newsResultState {
        case .initalState:
            Button("Load News") {
                newsListViewModel.getAllNews()
            }
        case .fetchedNews(let newsList):
            List(newsList) { news in
                VStack {
                    Text(news.title)
                        .lineLimit(1)
                        .font(.title)
                        .padding(.bottom, 10)
                    Text(news.content)
                        .font(.body)
                        .lineLimit(2)
                }
            }
        case .loadingNews:
                ProgressView()
        case .failedToLoad(let message):
            //print("\(appError)")
            Text("appError \(message)")
        default:
            EmptyView()
        }
    }
}
