//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Haider Rathore on 08/07/2024.
//

import Combine
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var cities: Cities = Cities(cities: [])
    @Published var isLoading = true
    @Published var errorMessage: String?

    @Published var weatherResponse: WeatherResponse?
    @Published var cityResponse: CityResponse?

    private var weatherService = WeatherService()
    private var cancellables = Set<AnyCancellable>()
    
    func loadCityData() {
        guard let loadedCities: Cities = loadJson(filename: "cities") else { return }
        let sortredCities = loadedCities.cities.sorted { $0.city.lowercased() < $1.city.lowercased() }
        if let newCity = sortredCities.first {
            self.cityResponse = newCity
            self.fetchWeather(lat: newCity.lat, lon: newCity.long) { result in
                switch result {
                case .success(let weather):
                    self.weatherResponse = weather
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    
//    func loadCitiesData() {
//        guard let loadedCities: Cities = loadJson(filename: "cities") else { return }
//        let sortredCities = loadedCities.cities.sorted { $0.city.lowercased() < $1.city.lowercased() }
//
//        sortredCities.enumerated().forEach { index, city in
//            var newCity = city
//            self.fetchWeather(lat: newCity.lat, lon: newCity.long) { result in
//                switch result {
//                case .success(let weather):
//                    newCity.weather = weather
//                    self.cityResponse?.cities.append(newCity) // Reassign to trigger update
//                    self.cityResponse = Cities(cities: self.cityResponse?.cities.sorted { $0.city.lowercased() < $1.city.lowercased() } ?? [])
//                case .failure(let failure):
//                    print(failure)
//                }
//            }
//        }
//    }


    func loadCitiesData() {
        guard let loadedCities: Cities = loadJson(filename: "cities") else { return }
        let sortedCities = loadedCities.cities.sorted { $0.city.lowercased() < $1.city.lowercased() }

        // Create an array of publishers for each fetchWeather call
        let publishers = sortedCities.map { city -> AnyPublisher<(CityResponse, WeatherResponse), Error> in
            return Future<(CityResponse, WeatherResponse), Error> { promise in
                self.fetchWeather(lat: city.lat, lon: city.long) { result in
                    switch result {
                    case .success(let weather):
                        promise(.success((city, weather)))
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }
            }
            .eraseToAnyPublisher()
        }

        // Merge all publishers into a single publisher and collect results
        Publishers.MergeMany(publishers)
            .collect()
            .sink { completion in
                switch completion {
                case .finished:
                    // All requests finished successfully
                    self.cities = Cities(cities: self.cities.cities.sorted { $0.city.lowercased() < $1.city.lowercased() } ?? [])
                case .failure(let error):
                    print("Failed to fetch weather for all cities: \(error)")
                }
            } receiveValue: { cityWeatherPairs in
                // Update cityResponse with fetched weather
                for (city, weather) in cityWeatherPairs {
                    var updatedCities = self.cities.cities
                    if updatedCities.isEmpty {
                        updatedCities = sortedCities
                    }
                    if let index = updatedCities.firstIndex(where: { $0.city == city.city }) {
                        updatedCities[index].weather = weather
                    } else {
                        print("City not found: \(city.city)")
                    }
                    self.cities.cities = updatedCities
                }
            }
            .store(in: &cancellables)
    }

    
    func fetchWeather(lat: Double, lon: Double, completion: @escaping ((Result<WeatherResponse, Error>) -> Void)) {
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
                completion(.success(weatherResponse))
            })
            .store(in: &cancellables)
    }
}
