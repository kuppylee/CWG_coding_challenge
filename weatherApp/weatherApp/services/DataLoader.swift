//
//  DataLoader.swift
//  weatherApp
//
//  Created by Kuppylee on 13/01/2023.
//

import Foundation

class DataLoader {
  // attributes
  var weatherData: [WeatherMain]?
  var forecastWeatherData: ForecastWeather?
  
  // Methods
  func getCurrentWeatherData( for city: String,completionHandler: @escaping (WeatherMain)-> ()){
  let urlString =  "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=2de4ef6576e4bf9900a89796db733e9c"
    if let url = URL(string: urlString ){
      URLSession.shared.dataTask(with: url) { data, response, error in
        if let currentWeatherData = data {
          do{
            let json = try JSONDecoder().decode(WeatherMain.self, from: currentWeatherData)
            completionHandler(json)
          }
          catch{
            print("error:\(error.localizedDescription)")
          }
        }
      }.resume()
    }
  }
  
  func getForeCastedWeatherData( for city: String,completionHandler: @escaping (ForecastWeather)-> ()){
  let urlString =  "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=2de4ef6576e4bf9900a89796db733e9c"
    if let url = URL(string: urlString ){
      URLSession.shared.dataTask(with: url) { data, response, error in
        if let forecastedWeatherData = data {
          do{
            let json = try JSONDecoder().decode(ForecastWeather.self, from: forecastedWeatherData)
            completionHandler(json)
          }
          catch{
            print("error:\(error.localizedDescription)")
          }
        }
      }.resume()
    }
  }
}
