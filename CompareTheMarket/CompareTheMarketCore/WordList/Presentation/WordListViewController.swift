//
//  WordListViewController.swift
//  CompareTheMarketCore
//
//  Created by Alexandre Freire on 07/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class WordListViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(WordCell.self)
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didLoad { [weak self] in
            guard let `self` = self else { return }
            self.tableView.reloadData()
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
