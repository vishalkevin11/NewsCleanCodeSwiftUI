//
//  NewsRepositoryImpl.swift
//  NewsCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 08/02/23.
//

import Combine
import Foundation

struct NewsRepositoryImpl: NewsRepository {
    
    let httpService: HttpService
    
    init(httpService: HttpService) {
        self.httpService = httpService
    }
    
    func fetchAllNews(forQuery query: String) -> AnyPublisher<[NewsEntity], AppError> {
        return httpService.getData("https://newsapi.org/v2/everything?apiKey=6b42d1b4f6fd44b1bafcd16742904f45&q=apple&pageSize=2")
            .decode(type: NewsListModel.self, decoder: JSONDecoder())
            .map{ newsListModel in
                newsListModel.newsList
            }
            .map{ newsModels -> [NewsEntity] in
                newsModels.map {
                    NewsEntity(title: $0.title, author: $0.author, imageUrl: $0.imageUrl, content: $0.content)
                }
            }
            .mapError { error -> AppError in
                        return AppError.serverError(error)
                    }
            
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchTopNews() -> AnyPublisher<[NewsEntity], AppError> {
        return Just([])
            
            //.setFailureType(to: AppError.self)
            .mapError { error -> AppError in
                        return AppError.serverError(error)
                    }
            .eraseToAnyPublisher()
//            .setFailureType(to: AppError.self)
//            .eraseToAnyPublisher()
    }
}

