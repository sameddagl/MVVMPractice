//
//  AuthorDetailPresentation.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

final class AuthorDetailPresentation {
    let quote: String
    
    init(quote: String) {
        self.quote = quote
    }
    
    convenience init(quote: Quote) {
        self.init(quote: quote.quote)
    }
}
