//
//  HomeView.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 29.06.2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    @State var weather: CurrentWeatherModel?
    @State var airPollution: AirPollutionModel?
    
    var body: some View {
        ZStack {
            VStack {
                if let location = locationManager.location {
                    if let weather = weather, let airPollution = airPollution {
                        WeatherView(weather: weather, airPollution: airPollution)
                    } else {
                        LoadingView()
                            .task {
                                do {
                                    weather = try await weatherManager.getCurrentWeather(lat: location.latitude, lon: location.longitude)
                                    airPollution = try await weatherManager.getAirPollutionData(lat: location.latitude, lon: location.longitude)
                                } catch {
                                    print("Error getting weather: \(error)")
                                }
                            }
                    }
                } else {
                    if locationManager.isLoading {
                        LoadingView()
                    } else {
                        WelcomeView()
                            .environmentObject(locationManager)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
