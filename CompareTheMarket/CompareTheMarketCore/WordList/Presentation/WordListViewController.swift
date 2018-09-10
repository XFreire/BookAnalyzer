//
//  WordListViewController.swift
//  CompareTheMarketCore
//
//  Created by Alexandre Freire on 07/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class WordListViewController: UIViewController {
    enum Constants {
        static let rowHeight: CGFloat = 65
    }
    // Mark: - Outlets
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(WordCell.self)
            tableView.rowHeight = Constants.rowHeight
        }
    }
    
    // Mark: - Properties
    private let viewModel: WordListViewModelProtocol
    private let cellPresenter: WordCellPresenter
    
    // Mark: - Initialization
    init(viewModel: WordListViewModelProtocol = WordListViewModel(), cellPresenter: WordCellPresenter = WordCellPresenter()) {
        self.viewModel = viewModel
        self.cellPresenter = cellPresenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = "List of words"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        viewModel.didLoad { [weak self] in
            guard let `self` = self else { return }
            self.tableView.reloadData()
            self.loading.stopAnimating()
        }
    }
}

extension WordListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(WordCell.self)

        guard let item = viewModel.item(at: indexPath.row) else {
            return cell
        }
        
        cellPresenter.present(item, in: cell)
        
        return cell
    }
    
    
}
