//
//  WordCountViewModel.swift
//  CompareTheMarketCore
//
//  Created by Alexandre Freire on 07/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

typealias Item = (word: Word, count: Int, isPrime: Bool)

protocol WordListViewModelProtocol {
    var count: Int { get }
    
    func item(at index: Int) -> Item?
    
    func didLoad(completion: () -> Void)
}

final class WordListViewModel: WordListViewModelProtocol {
    
    // Mark: - Properties
    private let book: Book
    private let analyzer: BookAnalyzerProtocol
    
    // Mark: - Initialization
    init(book: Book = Book()!, analyzer: BookAnalyzerProtocol = BookAnalyzer()) {
        self.book = book
        self.analyzer = analyzer
    }
    
    // MARK: - WordListViewModelProtocol
    func didLoad(completion: () -> Void) {
        analyzer.analyze(book: book)
        completion()
    }
    
    var count: Int {
        return analyzer.totalWordsCount
    }
    
    func item(at index: Int) -> Item? {
        guard let word = analyzer.word(at: index) else { return nil }
        let count = analyzer.count(of: word)
        let item = (word, count, count.isPrime)
        
        return item
    }
    
    
}
