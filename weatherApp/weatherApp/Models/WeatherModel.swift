//
//  WeatherModel.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 01.07.2022.
//

import Foundation

struct WeatherModel: Codable, Hashable, Equatable {
    let current: CurrentWeatherModel
    let daily: [DayWeatherModel]
}

struct CurrentWeatherModel: Codable, Hashable, Equatable {
    let temp: Double
    let feels_like: Double
    let pressure: Double
    let humidity: Double
    let uvi: Double
    let wind_speed: Double
    let clouds: Double
}

struct DayWeatherModel: Codable, Hashable, Equatable {
    let temp: TemperatureWeatherModel
    let feels_like: FeelsLikeWeatherModel
    let pressure: Double
    let humidity: Double
    let wind_speed: Double
    let uvi: Double
    let clouds: Double
//    static func == (lhs: DayWeatherModel, rhs: DayWeatherModel) -> Bool {
//        if lhs.temp.day == rhs.temp.day, lhs.temp.night == rhs.temp.night, lhs.temp.min == rhs.temp.min, lhs.temp.max == rhs.temp.max {
//            return true
//        } else {
//            return false
//        }
//    }
}

struct TemperatureWeatherModel: Codable, Hashable, Equatable {
    let day: Double
    let night: Double
    let min: Double
    let max: Double
}

struct FeelsLikeWeatherModel: Codable, Hashable, Equatable {
    let day: Double
    let night: Double
}

struct DayWithDateWeatherModel: Hashable, Equatable {
    let day: String
    let date: String
    let weather: DayWeatherModel
}

let daysWeatherExample: [DayWithDateWeatherModel] = [
    DayWithDateWeatherModel(day: "", date: "", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 0, night: 0, min: 0, max: 0), feels_like: FeelsLikeWeatherModel(day: 0, night: 0), pressure: 0, humidity: 0, wind_speed: 0, uvi: 0, clouds: 0)),
    DayWithDateWeatherModel(day: "", date: "", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 34, night: 15, min: 15, max: 34), feels_like: FeelsLikeWeatherModel(day: 34, night: 14), pressure: 1.92, humidity: 8.7, wind_speed: 2.3, uvi: 1.2, clouds: 2.3)),
    DayWithDateWeatherModel(day: "", date: "", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 0, night: 0, min: 0, max: 0), feels_like: FeelsLikeWeatherModel(day: 0, night: 0), pressure: 0, humidity: 0, wind_speed: 0, uvi: 0, clouds: 0)),
    DayWithDateWeatherModel(day: "", date: "", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 0, night: 0, min: 0, max: 0), feels_like: FeelsLikeWeatherModel(day: 0, night: 0), pressure: 0, humidity: 0, wind_speed: 0, uvi: 0, clouds: 0)),
    DayWithDateWeatherModel(day: "", date: "", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 0, night: 0, min: 0, max: 0), feels_like: FeelsLikeWeatherModel(day: 0, night: 0), pressure: 0, humidity: 0, wind_speed: 0, uvi: 0, clouds: 0)),
    DayWithDateWeatherModel(day: "", date: "", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 0, night: 0, min: 0, max: 0), feels_like: FeelsLikeWeatherModel(day: 0, night: 0), pressure: 0, humidity: 0, wind_speed: 0, uvi: 0, clouds: 0)),
    DayWithDateWeatherModel(day: "", date: "", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 0, night: 0, min: 0, max: 0), feels_like: FeelsLikeWeatherModel(day: 0, night: 0), pressure: 0, humidity: 0, wind_speed: 0, uvi: 0, clouds: 0))
]

let weatherExample: WeatherModel = WeatherModel(current: CurrentWeatherModel(temp: 30, feels_like: 32, pressure: 10, humidity: 20, uvi: 1, wind_speed: 0.3, clouds: 1.2), daily: [
    DayWeatherModel(temp: TemperatureWeatherModel(day: 34, night: 15, min: 15, max: 34), feels_like: FeelsLikeWeatherModel(day: 34, night: 14), pressure: 1.92, humidity: 8.7, wind_speed: 2.3, uvi: 1.2, clouds: 2.3),
    DayWeatherModel(temp: TemperatureWeatherModel(day: 34, night: 15, min: 15, max: 34), feels_like: FeelsLikeWeatherModel(day: 34, night: 14), pressure: 1.92, humidity: 8.7, wind_speed: 2.3, uvi: 1.2, clouds: 2.3),
    DayWeatherModel(temp: TemperatureWeatherModel(day: 34, night: 15, min: 15, max: 34), feels_like: FeelsLikeWeatherModel(day: 34, night: 14), pressure: 1.92, humidity: 8.7, wind_speed: 2.3, uvi: 1.2, clouds: 2.3),
    DayWeatherModel(temp: TemperatureWeatherModel(day: 34, night: 15, min: 15, max: 34), feels_like: FeelsLikeWeatherModel(day: 34, night: 14), pressure: 1.92, humidity: 8.7, wind_speed: 2.3, uvi: 1.2, clouds: 2.3),
    DayWeatherModel(temp: TemperatureWeatherModel(day: 34, night: 15, min: 15, max: 34), feels_like: FeelsLikeWeatherModel(day: 34, night: 14), pressure: 1.92, humidity: 8.7, wind_speed: 2.3, uvi: 1.2, clouds: 2.3),
    DayWeatherModel(temp: TemperatureWeatherModel(day: 34, night: 15, min: 15, max: 34), feels_like: FeelsLikeWeatherModel(day: 34, night: 14), pressure: 1.92, humidity: 8.7, wind_speed: 2.3, uvi: 1.2, clouds: 2.3),
    DayWeatherModel(temp: TemperatureWeatherModel(day: 34, night: 15, min: 15, max: 34), feels_like: FeelsLikeWeatherModel(day: 34, night: 14), pressure: 1.92, humidity: 8.7, wind_speed: 2.3, uvi: 1.2, clouds: 2.3)
])
