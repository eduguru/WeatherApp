//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Edwin Weru on 14/01/2025.
//
import Foundation

struct WeatherResponse: Decodable {
    var id: Double
    var main: String
    var description: String
    var icon: String
}
