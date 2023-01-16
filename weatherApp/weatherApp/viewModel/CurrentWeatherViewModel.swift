//
//  CurrentWeatherViewModel.swift
//  weatherApp
//
//  Created by Kuppylee on 13/01/2023.
//

import Foundation
import UIKit

class CurrentWeatherViewModel {
    var currentWeatherResult : WeatherMain?
    var dataLoader = DataLoader()
    var minimumTemp : Int?
    var maximumTemp : Int?
    var currentTemp : Int?
    var currentTempDescription : String?
    
    
    func getCurrentWeather(_ city : String, completion : @escaping() -> Void ){
        dataLoader.getCurrentWeatherData(for: city) {[self] currentWeather in
            currentWeatherResult = currentWeather
            currentTemp = Int((currentWeatherResult?.main.temp)!)
            maximumTemp = Int((currentWeatherResult?.main.temp_max)!)
            minimumTemp = Int((currentWeatherResult?.main.temp_min)!)
            currentTempDescription = currentWeatherResult?.weather[0].main ?? ""
            completion()
        }
    }

}
