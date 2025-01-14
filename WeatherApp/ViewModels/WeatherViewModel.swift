//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Edwin Weru on 14/01/2025.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var responseObject: WeatherResponseBody?
    @Published var error: NetworkError?
    
    private let networkManager: NetworkManaging
    private var lat: Double?
    private var long: Double?
    
    init(networkManager: NetworkManaging = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
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
}
