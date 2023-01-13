//
//  Models.swift
//  weatherApp
//
//  Created by Kuppylee on 13/01/2023.
//

import Foundation

enum CodingKeys: String, CodingKey{
  case date = "dt"
  case minimumTemperature = "temp_min"
  case maximumTemperature = "temp_max"
  case temperature = "temp"
  case mainWeatherDescription = "main"
}

//CURRENT DAY
struct Weather: Codable {
  var temp: Double
  var temp_min:Double
  var temp_max:Double
}

struct WeatherMain: Codable {
  let main: Weather
  let weather: [WeatherDescription]
}
struct WeatherDescription: Codable {
  let main: String
}
//5-DAYS FORECAST
struct ForecastWeather: Codable{
  var list: [ListDetails]
}

struct ListDetails: Codable {
  var dt: Double
  var main: MainDetails
  var weather: [WeatherDetails]
}

struct MainDetails: Codable{
  var temp: Float
}

struct WeatherDetails: Codable {
  var main: String
  var description: String
}
