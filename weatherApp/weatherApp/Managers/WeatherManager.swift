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
        guard let url = URL(string: Constants.baseAPIURL + "data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Constants.apiKEY)&units=metric") else {
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
    
    func getAirPollutionData(lat: CLLocationDegrees, lon: CLLocationDegrees) async throws -> AirPollutionModel {
        guard let url = URL(string: Constants.baseAPIURL + "/data/2.5/air_pollution?lat=\(lat)&lon=\(lon)&appid=\(Constants.apiKEY)") else {
            fatalError("Missing URL")
        }
        
        let task = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: task)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(AirPollutionModel.self, from: data)
        
        return decodedData
    }
    
    func getDailyWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) async throws -> [DailyWeatherModel.DayWeatherModel] {
        guard let url = URL(string: Constants.baseAPIURL + "/data/2.5/forecast/daily?lat=\(lat)&lon=\(lon)&cnt=16&appid=\(Constants.apiKEY)") else {
            fatalError("Missing URL")
        }
        
        let task = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: task)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(DailyWeatherModel.self, from: data)
        
        return decodedData.list
    }
}
