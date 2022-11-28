//
//  QuoteListBuilder.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

final class QuoteListBuilder {
    static func make() -> QuoteListVC{
        let vc = QuoteListVC()
        vc.viewModel = QuoteListVM(service: NetworkService())
        return vc
    }
}
