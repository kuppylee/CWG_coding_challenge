//
//  FavouriteWeatherModel.swift
//  weatherApp
//
//  Created by Kuppylee on 16/01/2023.
//

import Foundation
import RealmSwift

class FavouriteWeather : Object {
    @Persisted  var cityName : String = ""
    @Persisted  var favouriteWeatherDescription : String = ""
    @Persisted  var favouriteTemp : String = ""
    @Persisted  var lastUpdated : String = ""
}

