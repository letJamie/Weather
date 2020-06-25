 //
//  WeatherManager.swift
//  Weather
//
//  Created by Jamie on 2020/06/24.
//  Copyright © 2020 Jamie. All rights reserved.
//

import Foundation

 struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=ffa90d9279c5c55c5634e893ee47a6a1&units=metric"
    
    func fatchWeather(cityName: String) {
        
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handle(data: urlResponse: error:) )
                
            task.resume()
        }
        
        
    }
    
    func handle(data: Data?, urlResponse: URLResponse?, error: Error?) {
        
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
            
        }
    }
 }
