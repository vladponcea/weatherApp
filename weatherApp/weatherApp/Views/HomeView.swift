//
//  HomeView.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 29.06.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var vm: WeatherViewModel
    
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    @State var weather: WeatherModel?
    
    var body: some View {
        ZStack {
            VStack {
                if let location = locationManager.location {
                    if let weather = weather {
                        WeatherView(weather: weather)
                            .environmentObject(WeatherViewModel())
                    } else {
                        LoadingView()
                            .task {
                                do {
                                    weather = try await weatherManager.getWeatherData(lat: location.latitude, lon: location.longitude)
                                } catch {
                                    print("Error getting weather data...")
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
