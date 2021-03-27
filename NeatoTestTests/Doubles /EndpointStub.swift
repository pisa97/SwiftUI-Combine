//
//  EndpointStub.swift
//  NeatoTestTests
//
//  Created by Arcangelo Pisa on 27/03/21.
//

import Foundation
@testable import NeatoTest

enum EndpointStub: EndpointProtocol {
    
    case getMalformedUrl
    
    var baseURL: String {
        switch self {
        case .getMalformedUrl:
            return "url"
        }
    }
    
    var absoluteURL: String {
        switch self {
        case .getMalformedUrl:
            return baseURL + "/path"
        }
    }
    
    var params: [String: String] {
        return ["param1":"value1", "param2":"value2"]
    }
    
    var headers: [String: String] {
        return [
            "Content-type": "application/json",
            "Accept": "application/json"
        ]
    }
}
