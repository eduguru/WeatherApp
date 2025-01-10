//
//  WeatherStatusView.swift
//  WeatherApp
//
//  Created by Edwin Weru on 10/01/2025.
//
import SwiftUI

struct WeatherStatusView: View {
    let weatherStatusModel: WeatherStatusModel
    
    var body: some View {
        VStack {
            Text(weatherStatusModel.value)
                .font(weatherStatusModel.valueFont)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(weatherStatusModel.title)
                .font(weatherStatusModel.titleFont)
                .foregroundColor(.white)
        }
        .bold()
    }
}
