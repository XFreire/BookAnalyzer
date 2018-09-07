//
//  Book.swift
//  CompareTheMarket
//
//  Created by Alexandre Freire on 07/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation
final class DummyClass {}

struct Book {
    let text: String
    
    init?(fileName: String) {
        let dummy = DummyClass()
        let bundle = Bundle(for: type(of: dummy))
        
        guard let filepath = bundle.path(forResource: "book", ofType: "txt"),
        let text = try? String(contentsOfFile: filepath) else {
            return nil
        }
        
        self.text = text
    }
}
