//
//  CitiesModel.swift
//  WeatherApp
//
//  Created by Haider Rathore on 09/07/2024.
//

import Foundation

struct CityResponse: Codable, Identifiable {
    var id = UUID()
    let city: String
    let lat: Double
    let long: Double
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case city
        case lat
        case long
        case imageUrl
    }
}

struct Cities: Codable  {
    let cities: [CityResponse]
}

func loadJson<T: Decodable>(filename fileName: String) -> T? {
    if let url = Bundle.main.url(forResource: "CityData", withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
