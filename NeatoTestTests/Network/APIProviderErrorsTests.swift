//
//  APIProviderErrorsTests.swift
//  NeatoTestTests
//
//  Created by Arcangelo Pisa on 25/03/21.
//

import XCTest
@testable import NeatoTest

class APIProviderErrorsTests: XCTestCase {

    func testErrorDescription() {
        XCTAssertEqual(APIProviderErrors.dataNil.errorDescription, "Empty data.")
        XCTAssertEqual(APIProviderErrors.decodingError.errorDescription, "Data has invalid format.")
        XCTAssertEqual(APIProviderErrors.invalidURL.errorDescription, "Something goes wrong.")
        XCTAssertEqual(APIProviderErrors.unknownError.errorDescription, "Something goes wrong.")
    }
}
