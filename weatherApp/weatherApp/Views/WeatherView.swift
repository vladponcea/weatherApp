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
    
    @State var selectedDay: DayWeatherModel = weatherExample.daily[0]
    @State var selectedDate: String = ""
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea()
            
            VStack(spacing: 20) {
                DayWeatherView(dayWeather: selectedDay, date: selectedDate)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 50) {
                        ForEach(vm.days, id: \.day) { day in
                            ZStack {
                                if selectedDay == day.weather {
                                    Button(action: {
                                        
                                    }, label: {
                                        RoundedRectangle(cornerRadius: 32)
                                            .fill(.purple.opacity(0.5))
                                            .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/4)
                                    })
                                } else {
                                    Button(action: {
                                        self.selectedDay = day.weather
                                        self.selectedDate = day.day + " " + day.date
                                    }, label: {
                                        RoundedRectangle(cornerRadius: 32)
                                            .fill(.clear)
                                            .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/4)
                                    })
                                }
                                
                                VStack(spacing: 20) {
                                    VStack {
                                        Text(day.day)
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        Text(day.date)
                                            .font(.system(size: 15))
                                            .fontWeight(.light)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Image("cloudy")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                    
                                    Text("\(day.weather.temp.day.roundDouble())°")
                                        .font(.system(size: 25))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width-50)
        }
        .onAppear {
            vm.initalizeDays(for: self.weather)
            self.selectedDay = vm.days.first?.weather ?? weatherExample.daily[0]
            self.selectedDate = vm.days.first?.day ?? "" + " " + (vm.days.first?.date ?? "")
        }
        .animation(.default, value: self.selectedDay)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: weatherExample)
            .environmentObject(WeatherViewModel())
    }
}
