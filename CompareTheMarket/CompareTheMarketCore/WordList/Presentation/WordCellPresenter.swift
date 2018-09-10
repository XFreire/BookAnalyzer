//
//  WordCellPresenter.swift
//  CompareTheMarketCore
//
//  Created by Alexandre Freire on 07/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

final class WordCellPresenter {
    func present(_ item: Item, in cell: WordCell) {
        cell.wordLabel.text = """
        "\(item.word)"
        """
        
        let times = item.count > 1 ? "times" : "time"
        cell.countLabel.text = "Appears \(item.count) \(times)"
        
        cell.isPrimeLabel.text = item.isPrime ? "(prime)" : ""
        
    }
}
