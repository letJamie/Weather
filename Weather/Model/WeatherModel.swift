//
//  WeatherModel.swift
//  Weather
//
//  Created by Jamie on 2020/06/26.
//  Copyright © 2020 Jamie. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let conditionId : Int
    let cityName: String
    let temperature: Double
    
    func getConditionName(weatherId: Int) -> String {
           
           switch weatherId {
           case 200...232:
               return "cloud.bolt"
           case 300...321:
               return "cloud.drizzle"
           case 500...531:
               return "cloud.rain"
           case 600...622:
               return "cloud.snow"
           case 701...781:
               return "clound.fog"
           case 800:
               return "sun.max"
           case 801...804:
               return "cloud.bolt"
           default:
               return "cloud"
           }
    }
    
}
