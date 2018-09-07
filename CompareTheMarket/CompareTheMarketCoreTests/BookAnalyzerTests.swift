//
//  BookAnalyzerTests.swift
//  CompareTheMarketCoreTests
//
//  Created by Alexandre Freire on 07/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import CompareTheMarketCore

class BookAnalyzerTests: XCTestCase {

    var analyzer: BookAnalyzerProtocol!
    var loremBook: Book!
    
    override func setUp() {
        analyzer = BookAnalyzer()
        loremBook = Book(text: """
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.

            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.
            
            "Lorem" ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.

            Pede pede PeDe PEDE "Pede" -Pede.
        """)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBookAnalyzerExistence() {
        XCTAssertNotNil(analyzer)
    }
    
    func testBookAnalyzer_AnalyzeBook_ReturnsTheCorrectCountOfWords() {
        // Given a book
        
        // When
        analyzer.analyze(book: loremBook)
        
        // Then
        XCTAssertEqual(analyzer.totalWordsCount, 29)
        
    }
    
    func testBookAnalyzer_AnalyzeBook_ReturnsTheCorrectNumberOfSpecificWord() {
        // Given a book
        
        // When analyzes a book
        analyzer.analyze(book: loremBook)
        
        // Then
        XCTAssertEqual(analyzer.count(of: "Lorem"), 3)
        XCTAssertEqual(analyzer.count(of: "lorem"), 3)
        XCTAssertEqual(analyzer.count(of: "pede"), 9)
    }

    func testBookAnalyzer_AnalyzeBook_ReturnsWordsSortedAlphabetically() {
        // Given a book
        
        // When analyzes a book
        analyzer.analyze(book: loremBook)
        
        // Then
        XCTAssertEqual(analyzer.word(at: 0), "a")
        XCTAssertEqual(analyzer.word(at: 28), "volutpat")
        XCTAssertNil(analyzer.word(at: 29))
    }
}
