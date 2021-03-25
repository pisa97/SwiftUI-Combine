//
//  WeatherDegreeEndpoint.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 25/03/21.
//

import Foundation

/// That Endpoint contain the info data request to load a random Weather Degree for a SurfingSpot
enum WeatherDegreeEndpoint: EndpointProtocol {
    
    case getRandomNumber
    
    var baseURL: String {
        return "http://numbersapi.com"
    }
    
    var absoluteURL: String {
        switch self {
        case .getRandomNumber:
            return baseURL + "/random/math"
        }
    }
    
    var params: [String: String] {
        return [:]
    }
    
    var headers: [String: String] {
        return [
            "Content-type": "application/json",
            "Accept": "application/json"
        ]
    }
}
