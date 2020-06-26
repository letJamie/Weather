//
//  WeatherData.swift
//  Weather
//
//  Created by Jamie on 2020/06/26.
//  Copyright © 2020 Jamie. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp_min : Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}
