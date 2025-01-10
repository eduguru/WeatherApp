//
//  WeatherDayRangeView.swift
//  WeatherApp
//
//  Created by Edwin Weru on 10/01/2025.
//
import SwiftUI

struct WeatherDayRangeView: View {
    var body: some View {
        HStack(alignment: .center) {
            WeatherStatusView(weatherStatusModel: WeatherStatusModel(
                value: "77",
                title: "Sunny",
                valueFont: .title,
                titleFont: .title3)
            )
            Spacer()
            WeatherStatusView(weatherStatusModel: WeatherStatusModel(
                value: "77",
                title: "Sunny",
                valueFont: .title,
                titleFont: .title3)
            )
            Spacer()
            WeatherStatusView(weatherStatusModel: WeatherStatusModel(
                value: "77",
                title: "Sunny",
                valueFont: .title,
                titleFont: .title3)
            )
        }.padding()
    }
}
