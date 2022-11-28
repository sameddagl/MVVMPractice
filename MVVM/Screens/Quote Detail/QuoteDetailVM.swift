//
//  QuoteDetailVM.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

final class QuoteDetailVM: QuoteDetailVMProtocol {
    weak var delegate: QuoteDetailVMDelegate?
    
    private let quote: Quote
    
    init(quote: Quote) {
        self.quote = quote
    }
    
    func load() {
        delegate?.updateQuote(QuoteDetailPresentation(quote: quote))
    }
    
    func authorTapped() {
        delegate?.navigate(to: .authorDetail(authorName: quote.author))
    }
    
    
}
