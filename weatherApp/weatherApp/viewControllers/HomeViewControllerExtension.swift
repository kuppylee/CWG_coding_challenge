//
//  HomeViewControllerExtension.swift
//  weatherApp
//
//  Created by Kuppylee on 15/01/2023.
//

import Foundation
import UIKit

extension HomeViewController {
    //    Table view functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastedWeatherVM.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell

        if (forecastedWeatherVM.forecastedWeatherData.isEmpty){
            weatherTableView.setEmptyMessage("no data")
        }else {
            let forecastedWeatherVM = forecastedWeatherVM.cellForRowsAt(indexPath: indexPath)[indexPath.row]
            cell.day.text = getDate(Date(timeIntervalSince1970: Double(forecastedWeatherVM.date)))
            cell.tempLabel.text = "\(forecastedWeatherVM.temp - 273)º"
            switch currentWeatherDescriptionLabel.text {
            case "CLOUDS":
                cell.backgroundColor = Appstyle.clouds.color
            case "SUNNY":
                cell.backgroundColor = Appstyle.sunny.color
            case "RAIN":
                cell.backgroundColor = Appstyle.rainy.color
            default:
                cell.backgroundColor = Appstyle.others.color
            }
            switch forecastedWeatherVM.main {
            case "CLOUDS":
                cell.weatherIcon.image = Appstyle.clouds.icons
            case "SUNNY":
                cell.weatherIcon.image = Appstyle.sunny.icons
            case "RAIN":
                cell.weatherIcon.image = Appstyle.rainy.icons
            default:
                cell.weatherIcon.image = Appstyle.others.icons
            }
            cell.selectionStyle = .none
        }
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62.0;
    }
    
    
    
    
//    Function to display the current weather
    func displayCurrentWeather(){
        currentWeatherDataVm.getCurrentWeather(currentCity) {
            DispatchQueue.main.async { [ weak self] in
                if let minTemp = self?.currentWeatherDataVm.minimumTemp,
                   let maxTemp = self?.currentWeatherDataVm.maximumTemp,
                   let currentTemp = self?.currentWeatherDataVm.currentTemp {
                    self?.minWeatherValue.text = "\(minTemp - 273)º"
                    self?.maxWeatherValue.text = "\(maxTemp - 273)º"
                    self?.currentWeatherValue.text = "\(currentTemp - 273)º"
                    self?.currentWeatherLabel.text = "\(currentTemp - 273)º"
                    self?.currentWeatherDescriptionLabel.text = self?.currentWeatherDataVm.currentTempDescription?.uppercased()
                }
                
                switch self?.currentWeatherDescriptionLabel.text?.uppercased() {
                
                case "CLOUDY","CLOUDS":
                    self?.weatherImage.image = Appstyle.clouds.images
                    self?.currentTempView.backgroundColor = Appstyle.clouds.color
                    self?.superView.backgroundColor = Appstyle.clouds.color
                case "RAIN":
                    self?.weatherImage.image = Appstyle.rainy.images
                    self?.currentTempView.backgroundColor = Appstyle.rainy.color
                    self?.superView.backgroundColor = Appstyle.rainy.color
                case "SUNNY":
                    self?.weatherImage.image = Appstyle.sunny.images
                    self?.currentTempView.backgroundColor = Appstyle.sunny.color
                    self?.superView.backgroundColor = Appstyle.sunny.color
                default:
                    self?.weatherImage.image = Appstyle.others.images
                    self?.currentTempView.backgroundColor = Appstyle.others.color
                    self?.superView.backgroundColor = Appstyle.others.color
                }
            }
        }
    }
    
//    Function to display the forcasted weather
    func displayForcastedWeather(){
        forecastedWeatherVM.getForcastedWeather(currentCity) {
            DispatchQueue.main.async { [weak self] in
                if let weakSelf = self {
                    self?.weatherTableView.separatorStyle = .none
                    self?.weatherTableView.reloadData()
                }
            }
        }
    }
}


extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
