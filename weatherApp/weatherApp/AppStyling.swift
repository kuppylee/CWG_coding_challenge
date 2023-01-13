//
//  AppStyling.swift
//  weatherApp
//
//  Created by Kuppylee on 13/01/2023.
//

import Foundation
import UIKit

enum Appstyle {
  case clouds
  case rainy
  case sunny
  case others
  
  var color: UIColor{
    switch self{
    case.rainy:
      return UIColor(red: 0.34, green: 0.34, blue: 0.36, alpha: 1.00)
    case.clouds:
      return UIColor(red: 0.38, green: 0.52, blue: 0.58, alpha: 1.00)
    case.sunny:
      return  UIColor(red: 0.29, green: 0.56, blue: 0.89, alpha: 1.00)
    case.others:
      return UIColor(red: 0.29, green: 0.56, blue: 0.89, alpha: 1.00)
    }
  }
  
  var images: UIImage{
    switch self{
    case.rainy:
      return UIImage(named: "sea_rainy")!
    case.clouds:
      return UIImage(named: "sea_cloudy")!
    case.sunny:
      return UIImage(named: "sea_sunnypng")!
    case.others:
      return UIImage(named: "sea_sunnypng")!
    }
  }
  
  var icons: UIImage{
    switch self{
    case.rainy:
      return UIImage(named: "rain")!
    case.clouds:
      return UIImage(named: "partlysunny")!
    case.sunny:
      return UIImage(named: "clear")!
    case.others:
      return UIImage(named: "clear")!
    }
  }
}
