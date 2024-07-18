//
//  UserDefaults.swift
//  WeatherApp
//
//  Created by Haider Rathore on 18/07/2024.
//

import Foundation

extension UserDefaults {
    func setCodable<T: Codable>(_ value: T?, forKey key: String) {
        guard let value = value else {
            removeObject(forKey: key)
            return
        }
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(value)
            set(data, forKey: key)
        } catch {
            print("Error encoding object for key \(key): \(error)")
        }
    }

    func getCodable<T: Codable>(_ type: T.Type, forKey key: String) -> T? {
        guard let data = data(forKey: key) else { return nil }
        do {
            let decoder = JSONDecoder()
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            print("Error decoding object for key \(key): \(error)")
            return nil
        }
    }
}
