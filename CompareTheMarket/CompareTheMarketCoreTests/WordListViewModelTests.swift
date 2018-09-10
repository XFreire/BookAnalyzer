//
//  WordListViewModel.swift
//  CompareTheMarketCoreTests
//
//  Created by Alexandre Freire on 10/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import CompareTheMarketCore

class WordListViewModelTests: XCTestCase {
    var loremBook: Book!
    var viewModel: WordListViewModelProtocol!
    var analyzer: BookAnalyzerProtocol!
    
    override func setUp() {
        analyzer = BookAnalyzer()
        loremBook = Book(text: """
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.

            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.
            
            "Lorem" ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.

            Pede pede PeDe PEDE "Pede" -Pede.
        """)
        viewModel = WordListViewModel(book: loremBook, analyzer: analyzer)
        
        viewModel.didLoad {
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWordListViewModel_Count() {
        XCTAssertEqual(viewModel.count, 29)
    }
    
    func testWordListViewModel_ItemAtIndex() {
        let myItem: Item? = Item("pede", 9, false)
        let item: Item? = viewModel.item(at: 17)
        
        XCTAssertEqual(myItem?.word, item?.word)
        XCTAssertEqual(myItem?.count, item?.count)
        XCTAssertEqual(myItem?.isPrime, item?.isPrime)
    }
}
