//
//  Quotes.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

struct Quotes: Codable {
    let total, skip, limit: Int
    let quotes: [Quote]
}

struct Quote: Codable {
    let id: Int
    let quote: String
    let author: String
}
