//
//  QuoteListVM.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

final class QuoteListVM: QuoteListVMProtocol {
    
    weak var delegate: QuoteListVMDelegate?
    
    private let service: NetworkServiceProtocol
    
    private var quotes = [Quote]()
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func load() {
        notify(.startLoading)
        service.fetchData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let quotes):
                self.notify(.endLoading)
                self.quotes = quotes
                
                let quotesPresentation = quotes.map({QuoteListPresentation(quote: $0.quote)})
                self.notify(.updateData(quotesPresentation))
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectItem(at index: Int) {
        let selectedItem = quotes[index]
        delegate?.navigate(to: .detail(QuoteDetailVM(quote: selectedItem)))
    }
    
    private func notify(_ output: QuoteListVMOutput) {
        delegate?.handleWithOutput(output)
    }
    
}
