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
    @State var forecastRsponseObject: ForecastResponseBody?
    
    @State var color: Color = .gray
    @State var imageName: String = ""
    
    @StateObject var viewModel: WeatherViewModel  = WeatherViewModel()
    
    var body: some View {
        ZStack {
            Color(viewModel.responseObject?.weather[0].main.backgroundColor ?? color)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    HeaderView(
                        imageName: viewModel.responseObject?.weather[0].main.imageName ?? imageName,
                        weatherStatusModel: WeatherStatusModel(
                            value: "\(viewModel.responseObject?.main.temp.roundDouble() ?? "0.0")°",
                            title: "\(viewModel.responseObject?.weather[0].main.rawValue ?? "")",
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
                        if let forecastResponseObject = viewModel.forecastResponseObject {
                            let grouped = viewModel.groupedByDate(forecastResponseObject: forecastResponseObject)
                            
                            ForEach((1 ..< grouped.count), id: \.self) {
                                let list = grouped[$0]
                                WeatherSummaryView(
                                    dayName: list.formattedDate,
                                    imageName: list.weather[0].main.iconName,
                                    temp: "\(list.main.temp.roundDouble())°"
                                )
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
            
            await viewModel.fetchWeatherForecast(
                lat: locationManager.location?.latitude ?? 0.0,
                long: locationManager.location?.longitude ?? 0.0
            )
        }
    }
}

#Preview {
    ContentView()
}
