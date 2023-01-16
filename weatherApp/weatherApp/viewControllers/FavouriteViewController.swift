//
//  FavouriteViewController.swift
//  weatherApp
//
//  Created by Kuppylee on 15/01/2023.
//

import UIKit
import RealmSwift

class FavouriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var favouriteTableView: UITableView!
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favouriteTableView.dataSource = self
        favouriteTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let weatherInfomation = realm.objects(FavouriteWeather.self)
        return weatherInfomation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favouriteTableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as! FavouriteTableViewCell
        
        let weatherInfomation = realm.objects(FavouriteWeather.self)
        cell.cityName.text = weatherInfomation[indexPath.row].cityName
        cell.favWeatherDescription.text = weatherInfomation[indexPath.row].favouriteWeatherDescription
        cell.favouriteTempLabel.text = weatherInfomation[indexPath.row].favouriteTemp
        cell.lastUpdated.text = weatherInfomation[indexPath.row].lastUpdated

        cell.selectionStyle = .none
        return cell
    }
    
    // Delete the object from the Realm database
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let weatherToDelete = realm.objects(FavouriteWeather.self)
            try! realm.write {
                realm.delete(weatherToDelete[indexPath.row])
            }
            // Delete the row from the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}


