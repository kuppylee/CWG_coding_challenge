//
//  ForecastedWeatherViewModel.swift
//  weatherApp
//
//  Created by Kuppylee on 13/01/2023.
//

import Foundation
import ProgressHUD

struct ForecastedWeatherDetails {
    let date : Double
    let temp: Int
    let main: String
}


class ForecastedWeatherViewModel {
    var forcastedWeathers: ForecastWeather?
    var dataLoader = DataLoader()
    var forecastedWeatherData = [ForecastedWeatherDetails]()
    
    func getForcastedWeather(_ city : String, completion : @escaping() -> Void ){
        if (forecastedWeatherData.isEmpty){
            ProgressHUD.show()
            dataLoader.getForeCastedWeatherData(for: city) { [self] weather in
                self.forcastedWeathers = weather
                guard let weatherForcasted = forcastedWeathers?.list else {return}
                       
                forecastedWeatherData.append(ForecastedWeatherDetails(date: weatherForcasted[0].dt, temp: Int(weatherForcasted[0].main.temp), main: weatherForcasted[0].weather[0].main.uppercased()))
                
                forecastedWeatherData.append(ForecastedWeatherDetails(date: weatherForcasted[8].dt, temp: Int(weatherForcasted[8].main.temp), main: weatherForcasted[8].weather[0].main.uppercased()))
                    
                forecastedWeatherData.append(ForecastedWeatherDetails(date: weatherForcasted[16].dt, temp: Int(weatherForcasted[16].main.temp), main: weatherForcasted[16].weather[0].main.uppercased()))
                
                forecastedWeatherData.append(ForecastedWeatherDetails(date: weatherForcasted[24].dt, temp: Int(weatherForcasted[24].main.temp), main: weatherForcasted[24].weather[0].main.uppercased()))
                
                forecastedWeatherData.append(ForecastedWeatherDetails(date: weatherForcasted[32].dt, temp: Int(weatherForcasted[32].main.temp), main: weatherForcasted[32].weather[0].main.uppercased()))
                completion()
                ProgressHUD.dismiss()
            }
        }

    }
    
    func numberOfRowsInSection(section: Int) -> Int {
            return  forecastedWeatherData.count
        }
        func cellForRowsAt(indexPath: IndexPath) -> [ForecastedWeatherDetails] {
            return forecastedWeatherData
        }

}
