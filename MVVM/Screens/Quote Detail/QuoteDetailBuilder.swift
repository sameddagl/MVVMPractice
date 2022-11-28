//
//  QuoteDetailBuilder.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

final class QuoteDetailBuilder {
    
    static func make(with viewModel: QuoteDetailVMProtocol) -> QuoteDetailVC {
        let vc = QuoteDetailVC()
        vc.viewModel = viewModel
        return vc
    }
}
