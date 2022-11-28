//
//  QuoteDetailVC.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import UIKit

final class QuoteDetailVC: UIViewController {
    let quoteLabel = UILabel()
    let authorNameButton = UIButton()
    
    var viewModel: QuoteDetailVMProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        viewModel.delegate = self
        viewModel.load()
    }
}

extension QuoteDetailVC: QuoteDetailVMDelegate {
    
    func updateQuote(_ quote: QuoteDetailPresentation) {
        quoteLabel.text = quote.quote
        authorNameButton.setTitle(quote.author, for: .normal)
    }
    
    func navigate(to route: QuoteDetailRoute) {
        switch route {
        case .authorDetail(let authorName):
            let vc = AuthorDetailBuilder.make(with: authorName)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

//MARK: - UI Related
extension QuoteDetailVC {
    func layout() {
        view.backgroundColor = .systemBackground
        
        quoteLabel.numberOfLines = 0
        quoteLabel.textAlignment = .center
        quoteLabel.font = .preferredFont(forTextStyle: .body)
        
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(quoteLabel)
        
        authorNameButton.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        authorNameButton.translatesAutoresizingMaskIntoConstraints = false
        authorNameButton.setTitleColor(.blue, for: .normal)

        authorNameButton.addTarget(self, action: #selector(authorTapped), for: .touchUpInside)
        view.addSubview(authorNameButton)
        
        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            quoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            quoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            authorNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authorNameButton.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 30),
//            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            authorLabel.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -50)
        ])
    }
    
    @objc private func authorTapped() {
        viewModel.authorTapped()
    }
}
