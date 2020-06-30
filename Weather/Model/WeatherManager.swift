 //
 //  WeatherManager.swift
 //  Weather
 //
 //  Created by Jamie on 2020/06/24.
 //  Copyright © 2020 Jamie. All rights reserved.
 //
 
 import Foundation
 import CoreLocation
 
 protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
 }
 
 struct WeatherManager {
    
    //let weatherModel = WeatherModel()
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=ffa90d9279c5c55c5634e893ee47a6a1&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        
        let urlString = "\(weatherURL)&q=\(cityName)"
        
        performRequest(urlString: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString: urlString)

        
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            
            let task = session.dataTask(with: url) { (data , urlResponse, error) in
                
                
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    
                    if let weather =  self.parseJason(weatherData: safeData){
                        self.delegate?.didUpdateWeather(self , weather: weather)
                        //self.delegate?.didUpdateWeather(weather: weather)
                    }
                    
                }
            }
            task.resume()
        }
        
        
    }
    
    func parseJason(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData )
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp_min
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weather
        }
        catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
 }
 
 
 
