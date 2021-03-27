//
//  SurfingSpotGeneratorTests.swift
//  NeatoTestTests
//
//  Created by Arcangelo Pisa on 27/03/21.
//

import XCTest
@testable import NeatoTest

class SurfingSpotGeneratorTests: XCTestCase {

    func testGenerateNewSurfingSpotFromIncomingArrayOfSurfingSpots() {
        var surfingSpots: SurfingSpots = [SurfingSpot(name: "1"), SurfingSpot(name: "1"), SurfingSpot(name: "1")]
        
        let sut = SurfingSpotsGenerator(seed: UInt64(100))
        
        surfingSpots = sut.generateSurfingSpots(from: surfingSpots)
        
        for element in surfingSpots {
            XCTAssertEqual(element.imageUrl, "https://picsum.photos/600/300")
        }
        
        XCTAssertEqual(surfingSpots.count, 3)
        XCTAssertEqual(surfingSpots[0].degree, 14)
        XCTAssertEqual(surfingSpots[1].degree, 24)
        XCTAssertEqual(surfingSpots[2].degree, 5)
    }

}
