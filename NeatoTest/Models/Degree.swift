//
//  Degree.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 25/03/21.
//

import Foundation

/// This object is used to store information about degree, if it is found
struct Degree: Codable {
    
    /// A parameter representing the degree value
    let number: Int
    
    /// A parameter representing if the degree value has been found
    var found: Bool
}
