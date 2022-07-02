//
//  WeatherView.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 01.07.2022.
//

import SwiftUI

struct WeatherView: View {
    
    @EnvironmentObject var vm: WeatherViewModel
    
    let weather: WeatherModel
    
    @State var days: [_DayWeatherModel] = []
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea()
            
            VStack(spacing: 20) {
                DayWeatherView(dayWeather: vm.convertDay(day: vm.selectedDay))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 50) {
                        ForEach($vm.days, id: \.self) { $day in
                            ZStack {
                                Button(action: {
//                                    day.selected.toggle()
                                    if vm.selectedDay != dayWeatherExample[0] {
                                        guard let index = vm.days.firstIndex(where: { $0.day == vm.selectedDay.day }) else {
                                            return
                                        }
                                        vm.days[index].selected = false
                                        vm.selectedDay = day
                                        day.selected = true
                                    }
                                }, label: {
                                    RoundedRectangle(cornerRadius: 32)
                                        .fill(.purple.opacity(0.5))
                                        .frame(width: UIScreen.main.bounds.width/7, height: UIScreen.main.bounds.height/4)
                                        .opacity(day.selected ? 1 : 0)
                                })
                                
                                VStack(spacing: 20) {
                                    VStack {
                                        Text("\(day.day)")
                                            .font(.system(size: 16))
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        
                                        Text("\(day.date)")
                                            .font(.system(size: 11))
                                            .fontWeight(.light)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Image("cloudy")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                    
                                    VStack {
                                        Text("\(day.weather.temp.day.roundDouble())")
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        
                                        VStack(alignment: .leading) {
                                            Text("Min: \(day.weather.temp.min.roundDouble())")
                                                .font(.system(size: 11))
                                                .fontWeight(.light)
                                                .foregroundColor(.gray)
                                            
                                            Text("Max: \(day.weather.temp.max.roundDouble())")
                                                .font(.system(size: 11))
                                                .fontWeight(.light)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
//                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width-50)
            .animation(.default, value: vm.days)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: weatherExample)
            .environmentObject(WeatherViewModel())
    }
}
