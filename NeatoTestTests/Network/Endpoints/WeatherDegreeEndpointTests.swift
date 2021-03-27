//
//  WeatherDegreeEndpointTests.swift
//  NeatoTestTests
//
//  Created by Arcangelo Pisa on 27/03/21.
//

import XCTest
@testable import NeatoTest

class WeatherDegreeEndpointTests: XCTestCase {

    let sut = WeatherDegreeEndpoint.getRandomNumber
    
    func testBaseUrl() {
        XCTAssertEqual(sut.baseURL, "http://numbersapi.com")
    }
    
    func testAbsoluteUrl() {
        XCTAssertEqual(sut.absoluteURL, "http://numbersapi.com/random/math")
    }
    
    func testParms() {
        XCTAssertEqual(sut.params, [:])
    }
    
    func testHeaders() {
        XCTAssertEqual(sut.headers, [
            "Content-type": "application/json",
            "Accept": "application/json"
        ])
    }
}
