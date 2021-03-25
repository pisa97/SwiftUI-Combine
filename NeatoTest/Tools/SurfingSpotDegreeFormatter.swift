//
//  SurfingSpotDegreeFormatter.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 25/03/21.
//

import Foundation

/// This formatter is used to format information related to a surfing spot based on the degree value
class SurfingSpotDegreeFormatter {
    
    enum WeatherStatus: String {
        case sunny
        case cloudy
    }
    
    /// - Return the weather state of the surfing spot
    func getWeatherStatus(from degree: Int?) -> WeatherStatus {
        
        if let degree = degree, degree >= 30 {
            return .sunny
        } else {
            return .cloudy
        }
    }
    
    /// - Return the formatted information about the weather condition of the surfing spot
    func getFormattedDegreeData(from degree: Int?) -> String {
        
        guard let degree = degree else { return ""}
        return "\(getWeatherStatus(from: degree).rawValue.capitalizeFirstLetter()) - \(degree) degrees"
    }
}
