//
//  QuoteDetailPresentation.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

final class QuoteDetailPresentation {
    let quote: String
    let author: String
    
    init(quote: String, author: String) {
        self.quote = quote
        self.author = author
    }
    
    convenience init(quote: Quote) {
        self.init(quote: quote.quote, author: quote.author)
    }
}
