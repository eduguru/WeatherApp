//
//  WeatherDayRangeView.swift
//  WeatherApp
//
//  Created by Edwin Weru on 10/01/2025.
//
import SwiftUI

struct WeatherDayRangeView: View {
    var response: MainResponse?
    
    var body: some View {
        HStack(alignment: .center) {
            WeatherStatusView(weatherStatusModel: WeatherStatusModel(
                value: "\(response?.tempMin.roundDouble() ?? "0.0")°",
                title: "Min",
                valueFont: .title,
                titleFont: .title3)
            )
            Spacer()
            WeatherStatusView(weatherStatusModel: WeatherStatusModel(
                value: "\(response?.temp.roundDouble() ?? "0.0")°",
                title: "Current",
                valueFont: .title,
                titleFont: .title3)
            )
            Spacer()
            WeatherStatusView(weatherStatusModel: WeatherStatusModel(
                value: "\(response?.tempMax.roundDouble() ?? "0.0")°",
                title: "Max",
                valueFont: .title,
                titleFont: .title3)
            )
        }.padding()
    }
}
