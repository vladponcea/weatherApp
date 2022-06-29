//
//  DailyWeatherModel.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 29.06.2022.
//

import Foundation

struct DailyWeatherModel: Codable {
    let list: [DayWeatherModel]
    
    struct DayWeatherModel: Codable {
        let temp: TempDayWeatherModel
        let feels_like: FeelsLikeDayWeatherModel
    }
    
    struct TempDayWeatherModel: Codable {
        let day: Double
        let night: Double
        let min: Double
        let max: Double
    }
    
    struct FeelsLikeDayWeatherModel: Codable {
        let day: Double
    }
}
