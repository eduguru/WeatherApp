//
//  WeatherResponseBody.swift
//  WeatherApp
//
//  Created by Edwin Weru on 14/01/2025.
//
import Foundation

struct WeatherResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
}
