//
//  NewsEntity.swift
//  NewsCleanCodeSwiftUI
//
//  Created by Kevin.Saldanha on 08/02/23.
//

import Foundation

struct NewsEntity: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var author: String
    var imageUrl: String
    var content: String
}
