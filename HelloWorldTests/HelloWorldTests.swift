//
//  HelloWorldTests.swift
//  HelloWorldTests
//
//  Created by Rici on 08/01/2024.
//

import XCTest
@testable import HelloWorld

final class HelloWorldTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssertTrue(true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        XCTAssertTrue(true)
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}