//
//  WeatherManager.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 29.06.2022.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) async throws -> CurrentWeatherModel {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=ea53fcdc9f26cf225790797209e83b11&units=metric") else {
            fatalError("Missing URL")
        }
        
        let task = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: task)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(CurrentWeatherModel.self, from: data)
        
        return decodedData
    }
}
