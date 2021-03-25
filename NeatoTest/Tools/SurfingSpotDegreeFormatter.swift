//
//  SurfingSpotDegreeFormatter.swift
//  NeatoTest
//
//  Created by Arcangelo Pisa on 25/03/21.
//

import Foundation

class SurfingSpotDegreeFormatter {
    
    enum WeatherStatus: String {
        case sunny
        case cloudy
    }
    
    func getWeatherStatus(from degree: Int?) -> WeatherStatus {
        
        if let degree = degree, degree >= 30 {
            return .sunny
        } else {
            return .cloudy
        }
    }
    
    func getFormattedDegreeData(from degree: Int?) -> String {
        
        guard let degree = degree else { return ""}
        return "\(getWeatherStatus(from: degree).rawValue.capitalizeFirstLetter()) - \(degree) degrees"
    }
}
