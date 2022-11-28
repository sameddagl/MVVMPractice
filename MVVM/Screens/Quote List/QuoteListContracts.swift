//
//  QuoteListContracts.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

protocol QuoteListVMProtocol {
    var delegate: QuoteListVMDelegate? { get set }
    func load()
    func selectItem(at index: Int)
}

enum QuoteListVMOutput {
    case startLoading
    case endLoading
    case updateData(_ quotes: [QuoteListPresentation])
}

enum MovieListViewRoute {
    case detail(QuoteDetailVMProtocol)
}

protocol QuoteListVMDelegate: AnyObject {
    func handleWithOutput(_ output: QuoteListVMOutput)
    func navigate(to route: MovieListViewRoute)
}


