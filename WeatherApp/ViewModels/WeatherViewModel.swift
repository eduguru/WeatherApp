//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Edwin Weru on 14/01/2025.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var responseObject: WeatherResponseBody?
    @Published var forecastResponseObject: ForecastResponseBody?
    
    @Published var error: NetworkError?
    
    private let networkManager: NetworkManaging
    private var lat: Double?
    private var long: Double?
    
    init(networkManager: NetworkManaging = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    @MainActor
    func fetchWeather(lat: Double, long: Double) async {
        self.lat = lat
        self.long = long
        
        do {
            self.responseObject = try await networkManager.fetch(from: WeatherEndpoint(lat: lat, long: long))
        } catch let error as NetworkError {
            self.error = error
        } catch {
            self.error = .unknownError(0)
        }
    }
    
    @MainActor
    func fetchWeatherForecast(lat: Double, long: Double) async {
        self.lat = lat
        self.long = long
        
        do {
            self.forecastResponseObject = try await networkManager.fetch(from: WeatherForecastEndpoint(lat: lat, long: long))
            
        } catch let error as NetworkError {
            self.error = error
        } catch {
            self.error = .unknownError(0)
        }
    }
}

extension WeatherViewModel {
    func groupedByDate(forecastResponseObject: ForecastResponseBody) -> [List] {
        let groupedDic = Dictionary(grouping: forecastResponseObject.list, by: { $0.formattedDate })
        var groupedList: [String: List] = [:]
        var groupedArray: [List] = []
        
        for (key, value) in groupedDic {
            guard let firstElement = value.first else {
                return groupedArray
            }
            
            groupedList[key] = firstElement
            groupedArray.append(firstElement)
        }

        return  groupedArray.sorted(by: { $0.formattedDate < $1.formattedDate })
    }
}
