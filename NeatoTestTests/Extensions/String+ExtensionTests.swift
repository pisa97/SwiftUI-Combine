//
//  String+ExtensionTests.swift
//  NeatoTestTests
//
//  Created by Arcangelo Pisa on 25/03/21.
//

import XCTest
@testable import NeatoTest

class String_ExtensionTests: XCTestCase {

    func testUppercaseFirstLetterOnEmptyString() {
        XCTAssertEqual("".capitalizeFirstLetter(), "")
    }
    
    func testUppercaseFirstLetterOnGenericString() {
        XCTAssertEqual("foo".capitalizeFirstLetter(), "Foo")
        XCTAssertEqual("fOO".capitalizeFirstLetter(), "FOO")
    }

}
