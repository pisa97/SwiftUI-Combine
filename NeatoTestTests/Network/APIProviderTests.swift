//
//  APIProviderTests.swift
//  NeatoTestTests
//
//  Created by Arcangelo Pisa on 26/03/21.
//

import XCTest
import Combine
import SwiftUI
@testable import NeatoTest

class APIProviderTests: XCTestCase {

    func testMakeRequestFromStubbedEndpoint() throws {
        let sut = APIProvider<EndpointStub>()
        
        XCTAssertNotNil(sut.performRequest(for: EndpointStub.getMalformedUrl))

        let request: URLRequest = try XCTUnwrap(sut.performRequest(for: EndpointStub.getMalformedUrl))
        
        XCTAssertEqual(request.url?.absoluteString, "url/path?param1=value1&param2=value2")
        XCTAssertEqual(request.cachePolicy, .reloadRevalidatingCacheData)
        XCTAssertEqual(request.timeoutInterval, 30)
    }
}
