//
//  JocksViewController.swift
//  UnlimitTest
//
//  Created by Sachin Yadav on 26/08/23.
//

import UIKit

fileprivate enum JocksTableSection: String, Hashable {
    case joke
}

final class JocksViewController: UITableViewController {
    
    private let reuseIdentifier = "JocksTableCell"
    private var dataSource: UITableViewDiffableDataSource<JocksTableSection, Joke>!
    private let presenter: JocksPresenterType
    
    init(presenter: JocksPresenterType = JocksPresenter()) {
        self.presenter = presenter
        super.init(style: .plain)
        presenter.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadJokes()
        presenter.startJokeFetcher()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.stopJokeFetcher()
    }
    
    private func setupUI(){
        title = "Unlimited Jokes"
        view.backgroundColor = .systemBackground
        tableView.register(JocksTableCell.self, forCellReuseIdentifier: reuseIdentifier)
        dataSource = createDataSource()
        tableView.dataSource = dataSource
    }
    
    private func createDataSource() -> UITableViewDiffableDataSource<JocksTableSection, Joke> {
         .init(tableView: tableView, cellProvider: { [weak self] tableView, indexPath, joke in
            guard let self = self,
                  let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as? JocksTableCell
            else {
                return UITableViewCell()
            }
            
            cell.configureData(joke: joke)
            return cell
        })
    }
}

// Jocks Presenter View Update Methods
extension JocksViewController: JocksPresenterViewDelegate {
    
    func updateJokes(jocks: [Joke]) {
        var snapshot = NSDiffableDataSourceSnapshot<JocksTableSection, Joke>()
        snapshot.appendSections([JocksTableSection.joke])
        snapshot.appendItems(jocks)
        dataSource.apply(snapshot)
    }
    
}
