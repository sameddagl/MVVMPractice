//
//  QuoteListPresentation.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

final class QuoteListPresentation {
    let quote: String
    
    init(quote: String) {
        self.quote = quote
    }

}

extension QuoteListPresentation {
    
    convenience init(quote: Quote) {
        self.init(quote: quote.quote)
    }
}
