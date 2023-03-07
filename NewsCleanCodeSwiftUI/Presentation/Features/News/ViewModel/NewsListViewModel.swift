//
//  NewsListViewModel.swift
//  NewsCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 09/02/23.
//

import Combine
import SwiftUI


typealias DisposeBag = Set<AnyCancellable>

//extension DisposeBag {
//   mutating func dispose() {
//        forEach {$0.cancel()}
//        removeAll()
//    }
//}



enum NewsResultState {
    case initalState
    case loadingNews
    case fetchedNews(newsList: [NewsEntity])
    case failedToLoad(message: String)
}

//extension Publisher where Self.Failure ==  Never {
//    // because the publisher can NEVER FAIL - by design!
//    internal  func sink(receiveValue: @escaping ((Self.Output) -> Void)) -> AnyCancellable {  }
//}

extension Subscribers {
    public enum Completion<Failure> where Failure : Error {
        case finished
        case failure(Failure)
    }
}

class NewsListViewModel: ObservableObject {
    private var newsUsecase = NewsUsecase(newsRepositoryImpl: NewsRepositoryImpl(httpService: HttpService()))
    @Published var newsList: [NewsEntity] = []
    @Published var newsResultState : NewsResultState = .initalState
    private var disposables = DisposeBag()
    
    func getAllNews() {
        newsResultState = .loadingNews
        newsUsecase.getAllNews(forQuery: "world")
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let appError):
                    self?.newsResultState = .failedToLoad(message:appError.errorDescription)
                }
            },  receiveValue: { [weak self] newsEntityList in
                self?.newsResultState = .fetchedNews(newsList: newsEntityList)
            })
            .store(in: &disposables)
    }

    //    deinit {
    //        disposables.dispose()
    //    }
}
