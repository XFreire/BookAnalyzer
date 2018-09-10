//
//  IntPrimeExtensionTests.swift
//  CompareTheMarketCoreTests
//
//  Created by Alexandre Freire on 10/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import CompareTheMarketCore

class IntPrimeExtensionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIntIsPrime() {
        XCTAssertTrue(2.isPrime)
        let numbers: [Int] = Array((1..<7920))
        let primes = numbers.filter { $0.isPrime }
        print(primes.count)
        XCTAssertEqual(MockData.primes.count, primes.count)
        XCTAssertEqual(MockData.primes, primes)
    }

}
