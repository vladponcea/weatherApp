//
//  WeatherView.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 29.06.2022.
//

import SwiftUI

struct WeatherView: View {
    var weather: CurrentWeatherModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: CurrentWeatherModel(coord: CurrentWeatherModel.CoordinatesResponse(lon: 0, lat: 0), weather: [CurrentWeatherModel.WeatherResponse(id: 0, main: "", description: "", icon: "")], main: CurrentWeatherModel.MainResponse(temp: 0, feels_like: 0, temp_min: 0, temp_max: 0, pressure: 0, humidity: 0), name: "", wind: CurrentWeatherModel.WindResponse(speed: 0, deg: 0)))
    }
}
