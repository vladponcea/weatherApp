//
//  WeatherViewModel.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 02.07.2022.
//

import Foundation

class WeatherViewModel: ObservableObject {
//    @Published var weather: WeatherModel = weatherExample
    @Published var days: [DayWithDateWeatherModel] = daysWeatherExample
    
    func initalizeDays(for weather: WeatherModel) {
        var today: Date = Date()
        for i in 0...6 {
            let calendar = Calendar.current
            let midnight = calendar.startOfDay(for: today)
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: midnight)!

            let dateFormatterDay = DateFormatter()
            let dateFormatterDate = DateFormatter()
            dateFormatterDay.dateFormat = "E"
            dateFormatterDate.dateFormat = "d MMMM"
            
            days[i] = DayWithDateWeatherModel(day: dateFormatterDay.string(from: tomorrow), date: dateFormatterDate.string(from: tomorrow), weather: weather.daily[i])
            
            today = tomorrow
        }
    }
}
