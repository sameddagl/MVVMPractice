//
//  AuthorDetailBuilder.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

final class AuthorDetailBuilder {
    static func make(with authorName: String) -> AuthorDetailVC {
        let vc = AuthorDetailVC()
        let viewModel = AuthorDetailVM(authorName: authorName, service: NetworkService())
        vc.viewModel = viewModel
        return vc
    }
}
