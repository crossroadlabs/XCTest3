//
//  XCTest3Tests.swift
//  XCTest3Tests
//
//  Created by Daniel Leping on 25/03/2016.
//  Copyright © 2016 Daniel Leping. All rights reserved.
//

import XCTest
import XCTest3

class XCTest3Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExpectation() {
        let expectation = self.expectation(withDescription: "test expectation")
        expectation.fulfill()
        
        self.waitForExpectations(withTimeout: 0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
