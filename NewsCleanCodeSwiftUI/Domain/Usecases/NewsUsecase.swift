//
//  NewsUsecase.swift
//  NewsCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 08/02/23.
//

import Combine
import Foundation

struct NewsUsecase {
    
    let newsRepositoryImpl: NewsRepositoryImpl
    
    init(newsRepositoryImpl: NewsRepositoryImpl) {
        self.newsRepositoryImpl = newsRepositoryImpl
    }
    
    func getAllNews(forQuery query: String) -> AnyPublisher<[NewsEntity], AppError> {
        newsRepositoryImpl.fetchAllNews(forQuery: query)
            
    }
    
    func getTopNews() -> AnyPublisher<[NewsEntity], AppError> {
        newsRepositoryImpl.fetchTopNews()
    }
}
