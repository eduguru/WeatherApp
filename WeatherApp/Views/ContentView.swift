//
//  ContentView.swift
//  WeatherApp
//
//  Created by Edwin Weru on 09/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.sunny)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    HeaderView(
                        imageName: "forest_sunny",
                        weatherStatusModel: WeatherStatusModel(
                            value: "77",
                            title: "Sunny",
                            valueFont: .system(size: 66, weight: .heavy),
                            titleFont: .title3)
                    )
                    
                    WeatherDayRangeView()
                    
                    Divider()
                        .frame(height: 1)
                        .background(.white)
                    
                    VStack {
                        List(DayOfWeek.allCases, id: \.hashValue) { day in
                            
                        }
                        ForEach( 0 ..< DayOfWeek.allCases.count, id:\.self) { index in
                            let dayName = DayOfWeek.allCases[index]
                            WeatherSummaryView(dayName: dayName.rawValue.capitalized)
                         }
                        
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
