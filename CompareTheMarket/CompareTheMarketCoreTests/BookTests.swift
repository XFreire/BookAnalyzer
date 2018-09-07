//
//  BookTests.swift
//  CompareTheMarketTests
//
//  Created by Alexandre Freire on 07/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Core

class BookTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBookExistence() {
        let book = Book(fileName: "book.txt")
        XCTAssertNotNil(book)
    }

}
