//
//  NewsListModel.swift
//  NewsCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 10/02/23.
//

import Foundation

struct NewsListModel: Decodable {
    var status: String
    var totalResults: Int
    var newsList: [NewsModel]
    
    private enum CodingKeys : String, CodingKey {
        case status = "status"
        case totalResults  = "totalResults"
        case newsList = "articles"
    }
}
