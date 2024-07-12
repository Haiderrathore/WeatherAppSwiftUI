//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Haider Rathore on 05/07/2024.
//

import Foundation
import Combine

struct WeatherResponse: Codable, Equatable {
    let current: CurrentWeather
    let hourly: [HourlyWeather]
    let daily: [DailyWeather]
}

struct CurrentWeather: Codable, Equatable {
    let dt: TimeInterval
    let sunrise: TimeInterval
    let sunset: TimeInterval
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let weather: [Weather]
}

struct HourlyWeather: Codable, Hashable, Equatable{
    let dt: TimeInterval
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let wind_speed: Double
    let wind_deg: Int
    let weather: [Weather]
    let pop: Double
}

struct DailyWeather: Codable, Equatable {
    let dt: TimeInterval
    let sunrise: TimeInterval
    let sunset: TimeInterval
    let temp: Temperature
    let feels_like: FeelsLike
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let wind_speed: Double
    let wind_deg: Int
    let weather: [Weather]
    let clouds: Int
    let pop: Double
    let rain: Double?
}

struct Temperature: Codable, Equatable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct FeelsLike: Codable, Equatable {
    let day: Double
    let night: Double
    let eve: Double
    let morn: Double
}

struct Weather: Codable, Hashable, Equatable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Alerts: Codable, Equatable {
    let sender_name: String
    let event: String
    let start: Int
    let end: Int
    let description: String
    let tags: String
}

class WeatherService {
    private let apiKey = "c365789139cfbd2536539a926a38715e"
    private let baseURL = "https://api.openweathermap.org/data/3.0/onecall"
    private var cancellable: AnyCancellable?

    func fetchWeather(lat: Double, lon: Double) -> AnyPublisher<WeatherResponse, Error> {
        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "lat", value: "\(lat)"),
            URLQueryItem(name: "lon", value: "\(lon)"),
            URLQueryItem(name: "exclude", value: "minutely"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: apiKey)
        ]

        let url = components.url!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
