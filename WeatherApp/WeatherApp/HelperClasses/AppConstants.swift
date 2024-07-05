//
//  AppConstants.swift
//  WeatherApp
//
//  Created by Haider Rathore on 04/07/2024.
//

import Foundation
struct AppConstants {

    enum ThemeColorNames: String {
        case homeSubbg = "HomeSubbg"
    }
    
    struct Images {
        static let humidityIcon = "HumidityIcon"
        static let locationIcon = "LocationIcon"
        static let moreIcon = "MoreIcon"
        static let tempratureIcom = "TempratureIcom"
        static let windIcon = "WindIcon"
        static let bgPlaceholder = "BgPlaceholder"
        static let darkening = "Darkening"
        static let savedLocationsBg = "SavedLocationsBg"
        static let searchIcon = "SearchIcon"
    }
    
    struct WeatherImages{
        static let night = "Night"
        static let night1 = "Night1"
        static let night2 = "Night2"
    }
    
    struct FontName {
        static let bold = "Roboto-Bold"
        static let light = "Roboto-Light"
        static let medium = "Roboto-Medium"
    }
}
