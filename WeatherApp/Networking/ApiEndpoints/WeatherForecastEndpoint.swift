//
//  WeatherForecastEndpoint.swift
//  WeatherApp
//
//  Created by Edwin Weru on 14/01/2025.
//

import Foundation

// https://api.openweathermap.org/data/2.5/forecast/daily?lat=44.34&lon=10.99&appid=appid
// https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=appid&exclude=hourly,daily&cnt=8

struct WeatherForecastEndpoint: Endpoint {
    let lat: Double
    let long: Double
    
    var baseURL: URL {
        URL(string: "https://api.openweathermap.org/")!
    }
    
    var path: String {
        "data/2.5/forecast"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
    
    var parameters: [String : Any]? {
        [
            "appid": Keys.openWeatherApiKey,
            "units": "metric",
            "exclude": "hourly,daily",
            "lat": lat,
            "lon": long
        ]
    }
}
