//
//  Int+Prime.swift
//  CompareTheMarketCore
//
//  Created by Alexandre Freire on 10/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

extension Int {
    var isPrime: Bool {
        return self > 1 && !(2..<self).contains { self % $0 == 0 }
    }
}
