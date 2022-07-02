//
//  WeatherModel.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 01.07.2022.
//

import Foundation

struct WeatherModel: Codable, Hashable {
    let current: CurrentWeatherModel
    let daily: [DayWeatherModel]
}

struct CurrentWeatherModel: Codable, Hashable {
    let temp: Double
    let feels_like: Double
    let pressure: Double
    let humidity: Double
    let uvi: Double
    let wind_speed: Double
    let clouds: Double
}

struct DayWeatherModel: Codable, Hashable {
    let temp: TemperatureWeatherModel
    let feels_like: FeelsLikeWeatherModel
    let pressure: Double
    let humidity: Double
    let wind_speed: Double
    let uvi: Double
    let clouds: Double
}

struct TemperatureWeatherModel: Codable, Hashable {
    let day: Double
    let night: Double
    let min: Double
    let max: Double
}

struct FeelsLikeWeatherModel: Codable, Hashable {
    let day: Double
    let night: Double
}

struct _DayWeatherModel: Hashable {
    let day: String
    let date: String
    let weather: DayWeatherModel
    var selected: Bool
}

let dayWeatherExample: [_DayWeatherModel] = [
    _DayWeatherModel(day: "0", date: "0", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 0, night: 0, min: 0, max: 0), feels_like: FeelsLikeWeatherModel(day: 0, night: 0), pressure: 0, humidity: 0, wind_speed: 0, uvi: 0, clouds: 0), selected: false),
    _DayWeatherModel(day: "0", date: "0", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 0, night: 0, min: 0, max: 0), feels_like: FeelsLikeWeatherModel(day: 0, night: 0), pressure: 0, humidity: 0, wind_speed: 0, uvi: 0, clouds: 0), selected: false),
    _DayWeatherModel(day: "0", date: "0", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 0, night: 0, min: 0, max: 0), feels_like: FeelsLikeWeatherModel(day: 0, night: 0), pressure: 0, humidity: 0, wind_speed: 0, uvi: 0, clouds: 0), selected: false),
    _DayWeatherModel(day: "0", date: "0", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 0, night: 0, min: 0, max: 0), feels_like: FeelsLikeWeatherModel(day: 0, night: 0), pressure: 0, humidity: 0, wind_speed: 0, uvi: 0, clouds: 0), selected: false),
    _DayWeatherModel(day: "0", date: "0", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 0, night: 0, min: 0, max: 0), feels_like: FeelsLikeWeatherModel(day: 0, night: 0), pressure: 0, humidity: 0, wind_speed: 0, uvi: 0, clouds: 0), selected: false),
    _DayWeatherModel(day: "0", date: "0", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 0, night: 0, min: 0, max: 0), feels_like: FeelsLikeWeatherModel(day: 0, night: 0), pressure: 0, humidity: 0, wind_speed: 0, uvi: 0, clouds: 0), selected: false),
    _DayWeatherModel(day: "0", date: "0", weather: DayWeatherModel(temp: TemperatureWeatherModel(day: 0, night: 0, min: 0, max: 0), feels_like: FeelsLikeWeatherModel(day: 0, night: 0), pressure: 0, humidity: 0, wind_speed: 0, uvi: 0, clouds: 0), selected: false)
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
