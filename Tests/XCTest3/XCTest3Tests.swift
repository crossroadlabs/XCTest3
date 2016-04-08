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
    
    func testExpectation() {
        let expectation = self.expectation(withDescription: "test expectation")
        expectation.fulfill()
        
        self.waitForExpectations(withTimeout: 0)
    }
    
    #if !os(Linux)
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            print("Measure test")
            // Put the code you want to measure the time of here.
        }
    }
    #endif
}

#if os(Linux)
extension XCTest3Tests {
	static var allTests : [(String, XCTest3Tests -> () throws -> Void)] {
		return [
			("testExpectation", testExpectation),
		]
	}
}
#endif