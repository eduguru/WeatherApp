//
//  HeaderView.swift
//  WeatherApp
//
//  Created by Edwin Weru on 10/01/2025.
//
import SwiftUI

struct HeaderView: View {
    let imageName: String
    let weatherStatusModel: WeatherStatusModel

    var body: some View {
        ZStack(alignment: .top) {
            Image(imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 330)
            
            WeatherStatusView(weatherStatusModel: weatherStatusModel)
                .padding(EdgeInsets(top: 60, leading: 0, bottom: 0, trailing: 0))
            
        }
    }
}
