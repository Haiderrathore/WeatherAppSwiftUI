//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Haider Rathore on 08/07/2024.
//

import Combine
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weatherResponse: WeatherResponse?
//    @Published var response: NewWeatherResponse?
    @Published var isLoading = true
    @Published var errorMessage: String?
    
    private var weatherService = WeatherService()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchWeather(lat: Double, lon: Double) {
        isLoading = true
        weatherService.fetchWeather(lat: lat, lon: lon)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    print("Error Fetching Weather.")
                    self.errorMessage = error.localizedDescription
                case .finished:
                    print("Weather Fetched.")
                    break
                }
            }, receiveValue: { weatherResponse in
                self.weatherResponse = weatherResponse
//                print("Weather Fetched  \(weatherResponse)")

            })
            .store(in: &cancellables)
    }
}
