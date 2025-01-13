//
//  ContentView.swift
//  WeatherApp
//
//  Created by Edwin Weru on 09/01/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        if let location = locationManager.location {
            HomeView()
                .environmentObject(locationManager)
        } else {
            if locationManager.isLoading {
                LoadingView()
            } else {
                WelcomeView()
                    .environmentObject(locationManager)
            }
        }
    }
}

#Preview {
    ContentView()
}
