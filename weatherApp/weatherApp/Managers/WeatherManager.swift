//
//  WeatherManager.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 29.06.2022.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    func getWeatherData(lat: CLLocationDegrees, lon: CLLocationDegrees) async throws -> WeatherModel {
        guard let url = URL(string: Constants.baseAPIURL + "/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,hourly,alerts&units=metric&appid=\(Constants.apiKEY)") else {
            fatalError("Missing URL")
        }
        
        let task = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: task)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data)
        
        return decodedData
    }
}
