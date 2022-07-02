//
//  WeatherViewModel.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 02.07.2022.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherModel = weatherExample
    @Published var days: [_DayWeatherModel] = [_DayWeatherModel(day: "0", date: "0", weather: weatherExample.daily[0], selected: false)]
    @Published var selectedDay: _DayWeatherModel = dayWeatherExample[0]
    
    init() {
        get7Days()
    }
    
    func get7Days() {
        var dates: [_DayWeatherModel] = []
        var today: Date = Date()
        for i in 0...6 {
            let calendar = Calendar.current
            let midnight = calendar.startOfDay(for: today)
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: midnight)!

            let dateFormatterDay = DateFormatter()
            let dateFormatterDate = DateFormatter()
            dateFormatterDay.dateFormat = "E"
            dateFormatterDate.dateFormat = "d MMMM"

            dates.append(_DayWeatherModel(day: dateFormatterDay.string(from: today), date: dateFormatterDate.string(from: tomorrow), weather: weather.daily[i], selected: false))
            
            today = tomorrow
        }
        days = dates
        days[0].selected = true
    }
    
    func convertDay(day: _DayWeatherModel) -> DayWeatherModel{
        return DayWeatherModel(temp: TemperatureWeatherModel(day: day.weather.temp.day, night: day.weather.temp.night, min: day.weather.temp.min, max: day.weather.temp.max), feels_like: FeelsLikeWeatherModel(day: day.weather.feels_like.day, night: day.weather.feels_like.night), pressure: day.weather.pressure, humidity: day.weather.humidity, wind_speed: day.weather.wind_speed, uvi: day.weather.uvi, clouds: day.weather.clouds)
    }
}
