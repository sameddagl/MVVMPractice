//
//  QuoteDetailContracts.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

protocol QuoteDetailVMProtocol {
    var delegate: QuoteDetailVMDelegate? { get set }
    func load()
    func authorTapped()
}

enum QuoteDetailRoute {
    case authorDetail(authorName: String)
}
protocol QuoteDetailVMDelegate: AnyObject {
    func updateQuote(_ quote: QuoteDetailPresentation)
    func navigate(to route: QuoteDetailRoute)
}
