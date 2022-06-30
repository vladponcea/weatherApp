//
//  WeatherView.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 29.06.2022.
//

import SwiftUI

struct WeatherView: View {
    var weather: CurrentWeatherModel
    var airPollution: AirPollutionModel
    var weeklyForecast: DailyWeatherModel
    
    var currentDay: Date = Date()
    
    var rows: [GridItem] = [
        GridItem(.fixed(40), alignment: .leading),
        GridItem(.fixed(40), alignment: .leading),
    ]
    
    struct _weeklyForecastModel: Hashable {
        let day: String
        let date: String
        let forecast: DailyWeatherModel.DayWeatherModel
    }
    
    struct airQualityItem: Identifiable {
        let id: String = UUID().uuidString
        let name: String
        let icon: String
    }
    
    let airQualityItems: [airQualityItem] = [
        airQualityItem(name: "Real Feel", icon: "cloud.sun"),
        airQualityItem(name: "Wind", icon: "wind"),
        airQualityItem(name: "SO2", icon: "drop"),
        airQualityItem(name: "Humidity", icon: "cloud.rain"),
        airQualityItem(name: "Pressure", icon: "lungs"),
        airQualityItem(name: "O3", icon: "cloud"),
    ]
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea()
            
            Circle()
                .fill(LinearGradient(colors: [Color.purple, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                .offset(x: UIScreen.main.bounds.width/2)
                .opacity(0.1)
                .blur(radius: 200)
            
            VStack(spacing: 50) {
                //topbar
                HStack {
                    //left button
                    Button(action: {}, label: {
                        ZStack {
                            Circle()
                                .fill(.white)
                                .frame(width: 50, height: 50)
                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
                            
                            Image(systemName: "slider.horizontal.3")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                        }
                    })
                    
                    Spacer()
                    
                    //city name
                    HStack(spacing: 5) {
                        Image(systemName: "mappin.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                        
                        Text(weather.name)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    //profile picture
                    Button(action: {}, label: {
                        ZStack {
                            Circle()
                                .fill(.white)
                                .frame(width: 50, height: 50)
                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
                            
                            Image("pfp")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45)
                                .clipShape(Circle())
                        }
                    })
                }
                
                //body
                VStack(spacing: 20) {
                    RoundedRectangle(cornerRadius: 36)
                        .fill(LinearGradient(colors: [Color.purple, Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(height: UIScreen.main.bounds.height/5)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
                        .overlay(
                            VStack(alignment: .leading) {
                                HStack {
                                    Image("raining")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.width/2.5)
                                        .offset(y: -30)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading) {
                                        Text("\(weather.main.temp.roundDouble())°")
                                            .font(.system(size: 40))
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        
                                        Text("Feels like \(weather.main.feels_like.roundDouble())°")
                                            .font(.system(size: 14))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.gray)
                                        
//                                        Spacer()
                                    }
                                }
                                
                                Text(getCurrentDate())
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .offset(y: -20)
                            }
                                .padding(15)
//                                .frame(height: UIScreen.main.bounds.height/5)
                        )
                    
                    
                    RoundedRectangle(cornerRadius: 36)
                        .fill(.white)
                        .frame(height: UIScreen.main.bounds.height/5)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
                        .overlay(
                            VStack(alignment: .leading) {
                                HStack(spacing: 10) {
                                    Image(systemName: "cloud.rain")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.purple)
                                    
                                    Text("Air Quality")
                                        .font(.system(size: 18))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                }
                                
                                LazyHGrid(rows: rows, spacing: 20) {
                                    ForEach(airQualityItems) { item in
                                        HStack(spacing: 10) {
                                            Image(systemName: item.icon)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(.purple)
                                            
                                            VStack(alignment: .leading) {
                                                Text(item.name)
                                                    .font(.system(size: 12))
                                                    .fontWeight(.thin)
                                                    .foregroundColor(.black)
                                                Text("\(getValueForItem(value: item.name, weather: weather, air: airPollution).roundDouble())")
                                                    .font(.system(size: 14))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }
                                }
                                
                            }
                        )
                    
                    //weekly forecast
                    VStack(spacing: 20) {
                        //weekly forecast text
                        HStack {
                            Text("Weekly forecast")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                HStack(spacing: 5) {
                                    Text("Next month")
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                    
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 10, height: 10)
                                }
                                .foregroundColor(.purple)
                            })
                        }
                        let days = get16Days()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 60) {
                                ForEach(days, id: \.self) { day in
                                    VStack {
                                        Text(day.day)
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                        
                                        Text(day.date)
                                            .font(.system(size: 10))
                                            .fontWeight(.light)
                                            .foregroundColor(.gray)
                                        
                                        Image("cloudy")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 30, height: 30)
                                        
                                        Text("\(day.forecast.temp.day.roundDouble())")
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        
                                        VStack(alignment: .leading) {
                                            Text("Min: \(day.forecast.temp.min.roundDouble())")
                                                .font(.system(size: 10))
                                                .fontWeight(.light)
                                                .foregroundColor(.gray)
                                            
                                            Text("Max: \(day.forecast.temp.max.roundDouble())")
                                                .font(.system(size: 10))
                                                .fontWeight(.light)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                }
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width-50)
        }
    }
    
    func getCurrentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, d MMMM"
        
        return dateFormatter.string(from: date)
    }
    
    func get16Days() -> [_weeklyForecastModel] {
        var dates: [_weeklyForecastModel] = []
        var today: Date = Date()
        for i in 0...6 {
            let calendar = Calendar.current
            let midnight = calendar.startOfDay(for: today)
            let tomorrow = calendar.date(byAdding: .day, value: 1, to: midnight)!
            
            let dateFormatterDay = DateFormatter()
            let dateFormatterDate = DateFormatter()
            dateFormatterDay.dateFormat = "E"
            dateFormatterDate.dateFormat = "d MMMM"
            
            dates.append(_weeklyForecastModel(day: dateFormatterDay.string(from: tomorrow), date: dateFormatterDate.string(from: tomorrow), forecast: weeklyForecast.daily[i]))
            today = tomorrow
        }
//        print(dates)
        return dates
    }
    
    func getValueForItem(value: String, weather: CurrentWeatherModel, air: AirPollutionModel) -> Double {
        switch value {
        case "Real Feel":
            return weather.main.feels_like
        case "Wind":
            return weather.wind.speed
        case "SO2":
            return air.list.first?.components.so2 ?? 0
        case "Humidity":
            return weather.main.humidity
        case "Pressure":
            return weather.main.pressure
        case "O3":
            return air.list.first?.components.o3 ?? 0
        default:
            return 0
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: CurrentWeatherModel(coord: CurrentWeatherModel.CoordinatesResponse(lon: 0, lat: 0), weather: [CurrentWeatherModel.WeatherResponse(id: 0, main: "", description: "", icon: "")], main: CurrentWeatherModel.MainResponse(temp: 0, feels_like: 0, temp_min: 0, temp_max: 0, pressure: 0, humidity: 0), name: "Rosiori", wind: CurrentWeatherModel.WindResponse(speed: 0, deg: 0)), airPollution: AirPollutionModel(list: [AirPollutionModel.AirPollutionModelList(main: AirPollutionModel.AirPollutionModelMain(aqi: 1), components: AirPollutionModel.AirPollutionModelComponents(co: 0, no: 0, no2: 0, o3: 0, so2: 0, pm2_5: 0, pm10: 0, nh3: 0))]), weeklyForecast: DailyWeatherModel(
            daily: [
                DailyWeatherModel.DayWeatherModel(feels_like: DailyWeatherModel.DailyFeelsLikeModel(day: 0, night: 0), temp: DailyWeatherModel.DailyTempModel(day: 0, night: 0, min: 0, max: 0)),
                DailyWeatherModel.DayWeatherModel(feels_like: DailyWeatherModel.DailyFeelsLikeModel(day: 0, night: 0), temp: DailyWeatherModel.DailyTempModel(day: 0, night: 0, min: 0, max: 0)),
                DailyWeatherModel.DayWeatherModel(feels_like: DailyWeatherModel.DailyFeelsLikeModel(day: 0, night: 0), temp: DailyWeatherModel.DailyTempModel(day: 0, night: 0, min: 0, max: 0)),
                DailyWeatherModel.DayWeatherModel(feels_like: DailyWeatherModel.DailyFeelsLikeModel(day: 0, night: 0), temp: DailyWeatherModel.DailyTempModel(day: 0, night: 0, min: 0, max: 0)),
                DailyWeatherModel.DayWeatherModel(feels_like: DailyWeatherModel.DailyFeelsLikeModel(day: 0, night: 0), temp: DailyWeatherModel.DailyTempModel(day: 0, night: 0, min: 0, max: 0)),
                DailyWeatherModel.DayWeatherModel(feels_like: DailyWeatherModel.DailyFeelsLikeModel(day: 0, night: 0), temp: DailyWeatherModel.DailyTempModel(day: 0, night: 0, min: 0, max: 0)),
                DailyWeatherModel.DayWeatherModel(feels_like: DailyWeatherModel.DailyFeelsLikeModel(day: 0, night: 0), temp: DailyWeatherModel.DailyTempModel(day: 0, night: 0, min: 0, max: 0)),
            ]))
    }
}
