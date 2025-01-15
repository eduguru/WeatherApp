# iOS WeatherApp with SwiftUI

<div style="width: 1000px; height 600px;">
<img src="Screenshots/IMG_3198.png" width="30%" height="30%" align="right">
<img src="Screenshots/IMG_3199.png" width="30%" height="30%" align="right">
</div>

## Overview

`iOS WeatherApp uses [Openweathermap API](https://openweathermap.org/api) and build with SwiftUI. Feature include current weather & forecast. But detail not fully implemented because limited feature free plan from Openweathermap API.

### Keyword
- SwiftUI
- JSON & Codable
- MVVM
- ObservableObject

## Getting Started

### Prerequisites

- A valid API key from Openweathermap
- A Mac running macOS Catalina
- Xcode 11.3.1

### Installation

1. Clone or download the project to your local machine
2. Open the project in Xcode
3. Replace `YOURAPIKEY` with your valid Openweathermap API key
create this file since I have excluded it in the gitIgnore

enum Keys {
    static let openWeatherApiKey = "YOURAPIKEY"
}


4. Run the simulator

## Thanks to

Apple amazing library [SwiftUI](https://developer.apple.com/xcode/swiftui/)

Open API from [OpenWeatherMap](https://openweathermap.org/api)
