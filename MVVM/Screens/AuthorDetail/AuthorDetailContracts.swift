//
//  AuthorDetailContracts.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import Foundation

protocol AuthorDetailVMProtocol {
    var delegate: AutoherDetailVMDelegate? { get set }
    func load()
}

enum AutherDetailOutput {
    case updateTitle(String)
    case startLoading
    case endLoading
    case updateQuotes(_ quotes: [AuthorDetailPresentation])
}
protocol AutoherDetailVMDelegate: AnyObject {
    func handleWithOutput(_ output: AutherDetailOutput)
}
