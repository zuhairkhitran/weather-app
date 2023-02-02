//
//  WeatherData.swift
//  Weather
//
//  Created by Zuhair Hussain on 12/12/2021.
//

import Foundation

// MARK: - WeatherData
struct WeatherData: Codable {
    let weather: [Weather]?
    let main: Main?
    let name: String?
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}


// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}


// MARK: - WeatherForecastData
struct WeatherForecastData: Codable {
    let list: [WeatherForcastReport]
}

// MARK: - List
struct WeatherForcastReport: Codable {
    let temp: Temp?
    let weather: [Weather]?

    enum CodingKeys: String, CodingKey {
        case temp, weather
    }
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double?
    let eve, morn: Double?
}

// MARK: - ErrorResponse
struct ErrorResponse: Codable {
    let message: String
}
