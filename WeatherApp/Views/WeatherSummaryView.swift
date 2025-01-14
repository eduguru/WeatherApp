//
//  WeatherSummaryView.swift
//  WeatherApp
//
//  Created by Edwin Weru on 10/01/2025.
//
import SwiftUI

struct WeatherSummaryView: View {
    let dayName: String
    let imageName: String
    let temp: String
    
    var body: some View {
        HStack {
            Text(dayName)
                .font(.title3)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(imageName)
                .resizable()
                .frame(width: 35, height: 50)
            
            Text(temp)
                .font(.title3)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
