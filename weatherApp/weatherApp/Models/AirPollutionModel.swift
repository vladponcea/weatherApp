//
//  AirPollutionModel.swift
//  weatherApp
//
//  Created by Vladut Mihai Poncea on 29.06.2022.
//

import Foundation

struct AirPollutionModel: Codable {
    let list: [AirPollutionModelList]
    
    struct AirPollutionModelList: Codable {
        let main: AirPollutionModelMain
        let components: AirPollutionModelComponents
    }
    
    struct AirPollutionModelMain: Codable {
        let aqi: Int
    }
    
    struct AirPollutionModelComponents: Codable {
        let co: Double
        let no: Double
        let no2: Double
        let o3: Double
        let so2: Double
        let pm2_5: Double
        let pm10: Double
        let nh3: Double
    }
}
