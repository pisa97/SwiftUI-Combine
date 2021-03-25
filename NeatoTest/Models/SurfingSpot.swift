//
//  SurfingSpot.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 24/03/21.
//

import Foundation

/// This object is used to store information about the list of surfing spots available
typealias SurfingSpots = [SurfingSpot]

/// This object is used to store information about one single surfing spot
struct SurfingSpot: Codable, Hashable {
    
    /// A parameter representing the name of the surfing spot
    let name: String
    
    /// A parameter representing the image url of the surfing spot
    var imageUrl: String?
    
    /// A parameter representing the weather degree value of the surfing spot
    var degree: Int?
}
