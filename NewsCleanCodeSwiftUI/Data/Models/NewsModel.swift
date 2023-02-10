//
//  NewsModel.swift
//  NewsCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 08/02/23.
//

import Foundation

struct NewsModel: Decodable {
    var title: String
    var author: String
    var imageUrl: String
    var content: String
    
    private enum CodingKeys : String, CodingKey {
        case title = "title"
        case author  = "author"
        case imageUrl = "urlToImage"
        case content = "content"
    }
}
