//
//  SurfingSpotsGenerator.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 25/03/21.
//

import Foundation

class SurfingSpotsGenerator {

    private let randomImageUrl = "https://picsum.photos/600/300"
    
    private var generator: SeededRandomizer
    
    init(seed: UInt64) {
        generator = SeededRandomizer(seed: seed)
    }

    private func surfingSpot(from name: String) -> SurfingSpot {

        let degree = Int.random(in: -20...30, using: &generator)
        
        return SurfingSpot(name: name, imageUrl: randomImageUrl, degree: degree)
    }
    
    func generateSurfingSpots(from surfingSpots: SurfingSpots) -> SurfingSpots {
        var updatedSurfingSpots = SurfingSpots()
        
        for i in surfingSpots {
            updatedSurfingSpots.append(surfingSpot(from: i.name))
        }
        
        return updatedSurfingSpots
    }
}
