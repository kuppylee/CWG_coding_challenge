//
//  ViewController.swift
//  weatherApp
//
//  Created by Kuppylee on 12/01/2023.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var currentWeatherDescriptionLabel: UILabel!
    
    @IBOutlet weak var minWeatherValue: UILabel!
    @IBOutlet weak var maxWeatherValue: UILabel!
    @IBOutlet weak var currentWeatherValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        cell.tempLabel.text = "25º"
        cell.day.text = "Monday"
//        cell.weatherIcon
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62.0;
    }

}

class WeatherTableViewCell : UITableViewCell {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var day: UILabel!
    
}
