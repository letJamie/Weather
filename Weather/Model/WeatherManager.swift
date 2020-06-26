 //
 //  WeatherManager.swift
 //  Weather
 //
 //  Created by Jamie on 2020/06/24.
 //  Copyright © 2020 Jamie. All rights reserved.
 //
 
 import Foundation
 
 struct WeatherManager {
    
    //let weatherModel = WeatherModel()
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=ffa90d9279c5c55c5634e893ee47a6a1&units=metric"
    
    func fatchWeather(cityName: String) {
        
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data , urlResponse, error) in
                
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    
                    self.parseJason(weatherData: safeData)
                    
                }
            }
            task.resume()
        }
        
        
    }
    
    func parseJason(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData )
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp_min
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            print(weather.temperatureString)
        }
        catch {
            print(error)
        }
    }
    
    
 }
 
 
 
