//
//  WeatherSummaryView.swift
//  WeatherApp
//
//  Created by Edwin Weru on 10/01/2025.
//
import SwiftUI

struct WeatherSummaryView: View {
    let dayName: String
    var body: some View {
        HStack {
            Text(dayName)
                .font(.title3)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(.partlysunny)
                .resizable()
                .frame(width: 35, height: 50)
            
            Text("20°")
                .font(.title3)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
