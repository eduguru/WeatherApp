//
//  MainEnum.swift
//  WeatherApp
//
//  Created by Edwin Weru on 15/01/2025.
//
import SwiftUI

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case snow = "Snow"
    
    var iconName: String {
        switch self {
        case .clear: return "clear"
        case .clouds: return "partlysunny"
        case .snow: return "rain"
        }
    }
    
    var imageName: String {
        switch self {
        case .clear: return "forest_sunny"
        case .clouds: return "forest_cloudy"
        case .snow: return "forest_rainy"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .clear: return .sunny
        case .clouds: return .cloudy
        case .snow: return .rainy
        }
    }
}
