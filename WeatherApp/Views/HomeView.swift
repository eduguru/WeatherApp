//
//  HomeView.swift
//  WeatherApp
//
//  Created by Edwin Weru on 13/01/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    @State var responseObject: WeatherResponseBody?
    @StateObject var viewModel: WeatherViewModel  = WeatherViewModel()
    
    var body: some View {
        ZStack {
            Color(.sunny)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    HeaderView(
                        imageName: "forest_sunny",
                        weatherStatusModel: WeatherStatusModel(
                            value: "\(viewModel.responseObject?.main.temp.roundDouble() ?? "0.0")°",
                            title: "\(viewModel.responseObject?.weather[0].main ?? "")°",
                            valueFont: .system(size: 66, weight: .heavy),
                            titleFont: .title3,
                            desc: "\(viewModel.responseObject?.name ?? "")"
                        )
                    )
                    
                    WeatherDayRangeView(response: viewModel.responseObject?.main)
                    
                    Divider()
                        .frame(height: 1)
                        .background(.white)
                    
                    VStack {
                        List(DayOfWeek.allCases, id: \.hashValue) { day in
                            
                        }
                        ForEach( 0 ..< (viewModel.responseObject?.weather.count ?? 0), id:\.self) { index in
                            if let item = viewModel.responseObject?.weather[index ?? 0] {
                                let dayName = item.main
                                WeatherSummaryView(
                                    dayName: item.main,
                                    imageName: item.icon,
                                    temp: item.description)
                            }
                         }
                        
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
        .task {
            await viewModel.fetchWeather(
                lat: locationManager.location?.latitude ?? 0.0,
                long: locationManager.location?.longitude ?? 0.0
            )
        }
    }
}

#Preview {
    ContentView()
}
