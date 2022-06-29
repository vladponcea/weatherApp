//
//  CurrentWeatherModel.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 29.06.2022.
//

import Foundation

struct CurrentWeatherModel: Codable {
    let coord: CoordinatesResponse
    let weather: [WeatherResponse]
    let main: MainResponse
    let name: String
    let wind: WindResponse
    
    struct CoordinatesResponse: Codable {
        let lon: Double
        let lat: Double
    }
    
    struct WeatherResponse: Codable {
        let id: Double
        let main: String
        let description: String
        let icon: String
    }
    
    struct MainResponse: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Double
        let humidity: Double
    }
    
    struct WindResponse: Codable {
        let speed: Double
        let deg: Double
    }
}
