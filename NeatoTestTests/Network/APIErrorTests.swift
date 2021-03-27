//
//  APIErrorTests.swift
//  NeatoTestTests
//
//  Created by Arcangelo Pisa on 25/03/21.
//

import XCTest
@testable import NeatoTest

class APIErrorTests: XCTestCase {

    func testAPIErrorsErrorCodes() {
        XCTAssertEqual(APIErrors.badRequest.rawValue, 400)
        XCTAssertEqual(APIErrors.unAuthorized.rawValue, 401)
        XCTAssertEqual(APIErrors.tooManyRequests.rawValue, 429)
        XCTAssertEqual(APIErrors.serverError.rawValue, 500)
    }
    
    func testErrorDescription() {
        XCTAssertEqual(APIErrors.badRequest.errorDescription, "Something goes wrong.")
        XCTAssertEqual(APIErrors.unAuthorized.errorDescription, "Something goes wrong.")
        XCTAssertEqual(APIErrors.tooManyRequests.errorDescription, "You made too many requests within a window of time and have been rate limited. Back off for a while.")
        XCTAssertEqual(APIErrors.serverError.errorDescription, "Server error.")
    }

}
