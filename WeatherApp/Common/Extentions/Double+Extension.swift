//
//  Double+Extension.swift
//  WeatherApp
//
//  Created by Edwin Weru on 14/01/2025.
//

import Foundation
import SwiftUI

// Extension for rounded Double to 0 decimals
extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}
