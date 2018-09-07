//
//  BookAnalyzer.swift
//  CompareTheMarketCore
//
//  Created by Alexandre Freire on 07/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

typealias Word = String
typealias Words = [Word]
typealias WordsDictionary = [Word : Int]

protocol BookAnalyzerProtocol {
    
    func analyze(book: Book)
    
    func word(at index: Int) -> Word?
    
    func count(of word: Word) -> Int
    
    var totalWordsCount: Int { get }
    
}

final class BookAnalyzer: BookAnalyzerProtocol {
    
    // Mark: - Properties
    private var dictionary: WordsDictionary
    
    private var words: Words {
        return Array(dictionary.keys).sorted()
    }
    
    // Mark: - Initialization
    init() {
        self.dictionary = WordsDictionary()
    }
    
    
    // MARK: - BookAnalyzerProtocol
    func analyze(book: Book) {
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let components = book.text.components(separatedBy: chararacterSet)
        components
            .filter { !$0.isEmpty }
            .forEach {
                let word = $0.lowercased()
                let count = dictionary[word] ?? 0
                dictionary[word] = count + 1
            }
    }
    
    func count(of word: Word) -> Int {
        return dictionary[word.lowercased()] ?? 0
    }
    
    func word(at index: Int) -> Word? {
        guard index < totalWordsCount else {
            return nil
        }
        return words[index]
    }
    
    var totalWordsCount: Int {
        return words.count
    }
    
    
}
