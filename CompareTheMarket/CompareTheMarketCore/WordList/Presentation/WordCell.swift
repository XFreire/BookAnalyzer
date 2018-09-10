//
//  WordCell.swift
//  CompareTheMarketCore
//
//  Created by Alexandre Freire on 07/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

final class WordCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var isPrimeLabel: UILabel! {
        didSet {
            isPrimeLabel.textColor = .red
        }
    }
}
