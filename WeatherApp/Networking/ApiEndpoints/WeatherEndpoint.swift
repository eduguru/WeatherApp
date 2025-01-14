//
//  WeatherEndpoint.swift
//  WeatherApp
//
//  Created by Edwin Weru on 14/01/2025.
//
import Foundation

struct WeatherEndpoint: Endpoint {
    let lat: Double
    let long: Double
    
    var baseURL: URL {
        URL(string: "https://api.openweathermap.org/")!
    }
    
    var path: String {
        "data/2.5/weather"
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
            "lat": lat,
            "lon": long
        ]
    }
}
