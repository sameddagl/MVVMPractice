//
//  AuthorDetailVM.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

final class AuthorDetailVM: AuthorDetailVMProtocol {
    weak var delegate: AutoherDetailVMDelegate?
    
    private let authorName: String
    private let service: NetworkServiceProtocol
    
    init(authorName: String, service: NetworkServiceProtocol) {
        self.authorName = authorName
        self.service = service
    }
    
    func load() {
        notify(.updateTitle(authorName))
        notify(.startLoading)
        
        service.fetchData { [weak self] result in
            guard let self = self else { return }
            self.notify(.endLoading)
            
            switch result {
            case .success(let quotes):
                let quotesForAuthor = quotes.filter({$0.author == self.authorName})
                self.notify(.updateQuotes(quotesForAuthor.map({AuthorDetailPresentation(quote: $0)})))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func notify(_ output: AutherDetailOutput) {
        delegate?.handleWithOutput(output)
    }
    
    
}
