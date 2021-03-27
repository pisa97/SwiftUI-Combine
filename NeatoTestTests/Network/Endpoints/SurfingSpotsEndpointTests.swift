//
//  SurfingSpotsEndpointTests.swift
//  NeatoTestTests
//
//  Created by Arcangelo Pisa on 27/03/21.
//

import XCTest
@testable import NeatoTest

class SurfingSpotsEndpointTests: XCTestCase {

    let sut = SurfingSpotsEndpoint.getSources
    
    func testBaseUrl() {
        XCTAssertEqual(sut.baseURL, "https://run.mocky.io/v3")
    }
    
    func testAbsoluteUrl() {
        XCTAssertEqual(sut.absoluteURL, "https://run.mocky.io/v3/652ceb94-b24e-432b-b6c5-8a54bc1226b6")
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
