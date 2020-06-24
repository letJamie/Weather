 //
//  WeatherManager.swift
//  Weather
//
//  Created by Jamie on 2020/06/24.
//  Copyright © 2020 Jamie. All rights reserved.
//

import Foundation

 struct WeatherManager {
    
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=ffa90d9279c5c55c5634e893ee47a6a1&units=metric"
    
    func fatchWeather(cityName: String) {
        
        let urlString = "\(weatherURL)&q=\(cityName)"
    }
    
 }
