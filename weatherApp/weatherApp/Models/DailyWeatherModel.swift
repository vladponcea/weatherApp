//
//  DailyWeatherModel.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 29.06.2022.
//

import Foundation

struct DailyWeatherModel: Codable, Hashable {
    let daily: [DayWeatherModel]
//    let wind_speed: Double
    
    struct DayWeatherModel: Codable, Hashable {
        let feels_like: DailyFeelsLikeModel
        let temp: DailyTempModel
    }
    
    struct DailyFeelsLikeModel: Codable, Hashable {
        let day: Double
        let night: Double
    }
    
    struct DailyTempModel: Codable, Hashable {
        let day: Double
        let night: Double
        let min: Double
        let max: Double
    }
}
