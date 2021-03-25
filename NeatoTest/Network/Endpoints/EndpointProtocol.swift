//
//  EndpointProtocol.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 24/03/21.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String { get }
    
    var absoluteURL: String { get }
    
    var params: [String: String] { get }
    
    var headers: [String: String] { get }
}
