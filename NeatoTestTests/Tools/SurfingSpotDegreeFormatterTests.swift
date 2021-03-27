//
//  SurfingSpotDegreeFormatterTests.swift
//  NeatoTestTests
//
//  Created by Arcangelo Pisa on 27/03/21.
//

import XCTest
@testable import NeatoTest

class SurfingSpotDegreeFormatterTests: XCTestCase {

    let sut = SurfingSpotDegreeFormatter()
    
    func testGetWeatherStatus() {
        XCTAssertEqual(sut.getWeatherStatus(from: 30), .sunny)
        XCTAssertEqual(sut.getWeatherStatus(from: 300), .sunny)
        XCTAssertEqual(sut.getWeatherStatus(from: 29), .cloudy)
    }
    
    func testGetFormattedDegreeStatus() {
        XCTAssertEqual(sut.getFormattedDegreeData(from: 30), "Sunny - 30 degrees")
        XCTAssertEqual(sut.getFormattedDegreeData(from: 29), "Cloudy - 29 degrees")
    }

}

