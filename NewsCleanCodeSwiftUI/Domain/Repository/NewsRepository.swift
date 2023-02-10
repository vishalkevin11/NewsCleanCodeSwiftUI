//
//  NewsRepository.swift
//  NewsCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 08/02/23.
//

import Combine
import Foundation

protocol NewsRepository {
    func fetchAllNews(forQuery query: String) -> AnyPublisher<[NewsEntity], AppError>
    func fetchTopNews() -> AnyPublisher<[NewsEntity], AppError>
}
