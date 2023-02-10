//
//  AppError.swift
//  NewsCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 08/02/23.
//

import Foundation

enum AppError: Error, LocalizedError {
//    case networkError
//    case badUrl
//    case requestError
//    case  decodingError
//    case  statusNotOK
//    case serverError(Error)
    case invalidURL
    case httpCode(HTTPCode)
    case unexpectedResponse
    case serverError(Error)
    
    var errorDescription: String {
        switch self {
        case .invalidURL: return "Invalid URL"
        case let .httpCode(code): return "Unexpected HTTP code: \(code)"
        case .unexpectedResponse: return "Unexpected response from the server"
        case let .serverError(error): return "Cannot reach server \(error.localizedDescription)"
        }
    }
}

//extension AppError: LocalizedError {
//   
//}


typealias HTTPCode = Int
typealias HTTPCodes = Range<HTTPCode>

extension HTTPCodes {
    static let success = 200 ..< 300
}
