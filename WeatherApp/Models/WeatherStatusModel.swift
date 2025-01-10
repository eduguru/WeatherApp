//
//  WeatherStatusModel.swift
//  WeatherApp
//
//  Created by Edwin Weru on 10/01/2025.
//
import SwiftUI

struct WeatherStatusModel: Hashable, Identifiable {
    let id = UUID()
    let value: String
    let title: String
    let valueFont: Font
    let titleFont: Font
}
