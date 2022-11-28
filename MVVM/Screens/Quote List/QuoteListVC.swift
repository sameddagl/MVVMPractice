//
//  QuoteListVC.swift
//  MVVM
//
//  Created by Samed Dağlı on 28.11.2022.
//

import UIKit

final class QuoteListVC: UIViewController {
    private var tableView: UITableView!
    
    var viewModel: QuoteListVMProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private var quotes = [QuoteListPresentation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
        viewModel.load()
        
    }
}

extension QuoteListVC: QuoteListVMDelegate {
    func handleWithOutput(_ output: QuoteListVMOutput) {
        switch output {
        case .startLoading:
            print("Started to load")
        case .endLoading:
            print("End loading")
        case .updateData(let quotes):
            self.quotes = quotes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case .detail(let viewModel):
            let vc = QuoteDetailBuilder.make(with: viewModel)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension QuoteListVC: UITableViewDataSource {
    
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

extension QuoteListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectItem(at: indexPath.row)
    }
}

//MARK: - UI Related
extension QuoteListVC {
    
    private func layoutView() {
        tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
