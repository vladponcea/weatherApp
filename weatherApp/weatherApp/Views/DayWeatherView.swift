//
//  DayWeatherView.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 29.06.2022.
//

import SwiftUI

struct DayWeatherView: View {
    var dayWeather: DayWeatherModel
    var date: String
    
    var currentDay: Date = Date()
    
    var rows: [GridItem] = [
        GridItem(.fixed(40), alignment: .leading),
        GridItem(.fixed(40), alignment: .leading),
    ]
    
    struct airQualityItem: Hashable {
        let name: String
        let icon: String
    }
    
    let airQualityItems: [airQualityItem] = [
        airQualityItem(name: "Real Feel", icon: "cloud.sun"),
        airQualityItem(name: "Wind", icon: "wind"),
        airQualityItem(name: "Pressure", icon: "lungs"),
        airQualityItem(name: "Humidity", icon: "cloud.rain"),
        airQualityItem(name: "UVI", icon: "drop"),
        airQualityItem(name: "Clouds", icon: "cloud"),
    ]
    
    var body: some View {
        ZStack {
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
                        
                        Text("")
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
                                        Text("\(dayWeather.temp.day.roundDouble())°")
                                            .font(.system(size: 40))
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        
                                        Text("Feels like \(dayWeather.feels_like.day.roundDouble())°")
                                            .font(.system(size: 14))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.gray)
                                        
//                                        Spacer()
                                    }
                                }
                                
                                Text(date)
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
                                    ForEach(airQualityItems, id: \.self) { item in
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
                                                Text("\(getValueForItem(item: item.name, weatherData: dayWeather).roundDouble())")
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
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width-50)
        }
    }
    
    func getValueForItem(item: String, weatherData: DayWeatherModel) -> Double{
        switch item {
        case "Real Feel":
            return weatherData.feels_like.day
        case "Wind":
            return weatherData.wind_speed
        case "Pressure":
            return weatherData.pressure
        case "Humidity":
            return weatherData.humidity
        case "UVI":
            return weatherData.uvi
        case "Clouds":
            return weatherData.clouds
        default:
            return 0
        }
    }
    
    func getCurrentDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, d MMMM"
        
        return dateFormatter.string(from: date)
    }
}

struct DayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DayWeatherView(dayWeather: weatherExample.daily[0], date: "Thursday, 7 July")
    }
}
