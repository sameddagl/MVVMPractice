//
//  AuthorDetailVC.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import UIKit

final class AuthorDetailVC: UIViewController {
    private var tableView: UITableView!
    
    var viewModel: AuthorDetailVMProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private var quotes = [AuthorDetailPresentation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
        viewModel.load()
        
    }
}

extension AuthorDetailVC: AutoherDetailVMDelegate {
    func handleWithOutput(_ output: AutherDetailOutput) {
        switch output {
        case.updateTitle(let title):
            self.title = title
        case .startLoading:
            print("Started to load")
        case .endLoading:
            print("End loading")
        case .updateQuotes(let quotes):
            self.quotes = quotes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension AuthorDetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = quotes[indexPath.row].quote
        cell.textLabel?.numberOfLines = 0
        return cell
    }    
}


//MARK: - UI Related
extension AuthorDetailVC {
    
    private func layoutView() {
        tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
