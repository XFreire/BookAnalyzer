//
//  WordListAssembly.swift
//  CompareTheMarketCore
//
//  Created by Alexandre Freire on 07/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

final public class WordListAssembly {
    
    public func viewController() -> UIViewController {
        return WordListViewController(viewModel: viewModel(), cellPresenter: cellPresenter())
    }
    
    func viewModel() -> WordListViewModelProtocol {
        return WordListViewModel()
    }
    
    func cellPresenter() -> WordCellPresenter {
        return WordCellPresenter()
    }
}
