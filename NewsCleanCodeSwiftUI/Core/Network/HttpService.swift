//
//  HttpService.swift
//  NewsCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 08/02/23.
//

import Combine
import Foundation

class HttpService {
    
    func getData(_ urlString: String) -> AnyPublisher<Data, AppError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: AppError.invalidURL)
                .eraseToAnyPublisher()
        }
        print("Url \(urlString)")
        let config = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: config)
//urlSession.delegateQueue.cancelAllOperations()
        return urlSession.dataTaskPublisher(for: url)
        
            .tryMap { (data: Data, response: URLResponse) in
                guard
                    let response = response as? HTTPURLResponse else {
                throw AppError.unexpectedResponse
                   // return Fail<nil, AppError>(error: AppError.unexpectedResponse)
                }
                let code = response.statusCode
                if !HTTPCodes.success.contains(code) {
                    throw AppError.httpCode(code)
                   // return Fail(error: AppError.httpCode(code))
                       // .eraseToAnyPublisher()
                }
                return data
            }
            
            .map{$0}
            
//            .mapError{
//                AppError.serverError($0)
//            }
            .assertNoFailure()
            .setFailureType(to: AppError.self)
            .eraseToAnyPublisher()
            
    }
}
