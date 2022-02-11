//
//  SDKDomainInitializerTests.swift
//  SDKDomainTests
//

import XCTest
@testable import SDKDomain

final class SDKDomainInitializerTests: XCTestCase {
    
    func testHellorWorld() {
        XCTAssertEqual(SDKDomainInitializer.helloWorld(), "Hello World from SDK!!")
    }
    
}