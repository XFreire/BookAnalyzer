//
//  BookTests.swift
//  CompareTheMarketTests
//
//  Created by Alexandre Freire on 07/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import CompareTheMarketCore

class BookTests: XCTestCase {

    var book: Book!
    
    override func setUp() {
        book = Book()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBookExistence() {
        XCTAssertNotNil(book)
    }
    
    func testBookHasText() {
        XCTAssertGreaterThan(book.text.count, 0)
    }

}
