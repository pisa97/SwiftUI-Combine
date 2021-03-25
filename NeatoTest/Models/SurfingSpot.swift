//
//  SurfingSpot.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 24/03/21.
//

import Foundation

typealias SurfingSpots = [SurfingSpot]

struct SurfingSpot: Codable, Hashable {    
    let name: String
    var imageUrl: String?
    var degree: Int?
}
