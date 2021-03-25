//
//  SurfingSpotsEndpoint.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 24/03/21.
//

import Foundation

/// That Endpoint contain the info data request to load SurfingSpots
enum SurfingSpotsEndpoint: EndpointProtocol {
    
    case getSources
    
    var baseURL: String {
        return "https://run.mocky.io/v3"
    }
    
    var absoluteURL: String {
        switch self {
        case .getSources:
            return baseURL + "/652ceb94-b24e-432b-b6c5-8a54bc1226b6"
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
