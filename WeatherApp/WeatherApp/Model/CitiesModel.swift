//
//  CitiesModel.swift
//  WeatherApp
//
//  Created by Haider Rathore on 09/07/2024.
//

import Foundation

struct CityResponse: Codable, Identifiable, Equatable {
    var id = UUID()
    let city: String
    let lat: Double
    let long: Double
    let imageUrl: String
    var weather: WeatherResponse?

    enum CodingKeys: String, CodingKey {
        case city
        case lat
        case long
        case imageUrl
        case weather
    }
}

struct Cities: Codable, Identifiable, Equatable  {
    var id = UUID()
    var cities: [CityResponse]
    
    enum CodingKeys: CodingKey {
        case cities
    }
}
