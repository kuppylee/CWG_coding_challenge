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
        dataLoader.getCurrentWeatherData(for: city) {[weak self] currentWeather in
            self?.currentWeatherResult = currentWeather
            self?.currentTemp = Int((self?.currentWeatherResult?.main.temp)!)
            self?.maximumTemp = Int((self?.currentWeatherResult?.main.temp_max)!)
            self?.minimumTemp = Int((self?.currentWeatherResult?.main.temp_min)!)
            self?.currentTempDescription = self?.currentWeatherResult?.weather[0].main ?? ""
            completion()
        }
    }

}
