//
//  ViewController.swift
//  weatherApp
//
//  Created by Kuppylee on 12/01/2023.
//

import UIKit
import CoreLocation
import RealmSwift

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate , CLLocationManagerDelegate{
    
    var result: WeatherMain?
    var currentWeatherDataVm = CurrentWeatherViewModel()
    var forecastedWeatherVM = ForecastedWeatherViewModel()
    var locationManager: CLLocationManager!
    let geocoder = CLGeocoder()
    let realm = try! Realm()
    var currentCity : String = "Lagos"


    

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var currentWeatherDescriptionLabel: UILabel!
    
    @IBOutlet weak var minWeatherValue: UILabel!
    @IBOutlet weak var maxWeatherValue: UILabel!
    @IBOutlet weak var currentWeatherValue: UILabel!
    
    @IBOutlet weak var currentTempView: UIView!
    @IBOutlet var superView: UIView!
    
    @IBOutlet var likeBTN: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        displayCurrentWeather()
        displayForcastedWeather()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()       
    }
    
    lazy var emptyWeatherLabel: UILabel = {
      let label = UILabel()
      label.text = ""
      label.center = CGPoint(x: 160, y: 285)
      label.translatesAutoresizingMaskIntoConstraints = false
      label.numberOfLines = 1
      return label
    }()
    
    @IBAction func likeTapped(_ sender: UIButton) {
        if likeBTN.currentImage == UIImage(systemName: "heart") {
            likeBTN.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            //TODO: Add to realm
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let currentDate = formatter.string(from: Date())
            let favouriteWeather = FavouriteWeather()
            favouriteWeather.cityName = currentCity
            favouriteWeather.lastUpdated = currentDate
            favouriteWeather.favouriteTemp = currentWeatherValue.text!
            favouriteWeather.favouriteWeatherDescription = currentWeatherDescriptionLabel.text!
            try! realm.write {
                realm.add(favouriteWeather)
            }
        } else {
            likeBTN.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
//    This function is to get the current location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let currentLocation = locations.last else { return }
            geocoder.reverseGeocodeLocation(currentLocation) { (placemarks, error) in
                if let error = error {
                    print("Error getting current city name: \(error)")
                    return
                }
                guard let placemark = placemarks?.first else { return }
                guard let city = placemark.locality else { return }
                self.currentCity = city
                print("Current city name: \(city)")
            }
        }
   
//    This function is to format the date from the API call
    func getDate(_ date: Date?) -> String{
      guard let inputDate = date else {
        return ""
      }
      let formatter = DateFormatter()
      formatter.dateFormat = "EEEE"
      return formatter.string(from: inputDate)
    }
}


