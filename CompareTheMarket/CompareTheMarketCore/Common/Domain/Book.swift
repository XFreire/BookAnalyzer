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
    
    // Mark: - Properties
    let text: String
    
    // Mark: - Properties
    init(text: String) {
        self.text = text
    }
    
    init?(fileName: String = "book", ofType typeName: String = "txt") {
        
        let dummy = DummyClass()
        
        let bundle = Bundle(for: type(of: dummy))
        
        guard let filepath = bundle.path(forResource: fileName, ofType: typeName),
        let text = try? String(contentsOfFile: filepath) else {
            return nil
        }
        
        self.text = text
    }
}
