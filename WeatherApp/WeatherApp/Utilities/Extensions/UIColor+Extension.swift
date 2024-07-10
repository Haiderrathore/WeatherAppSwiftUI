//
//  UIColor+Extension.swift
//  WeatherApp
//
//  Created by Haider Rathore on 04/07/2024.
//

import SwiftUI

extension Color {
    static func getThemeColor(color: AppConstants.ThemeColorNames) -> Color {
        return Color(color.rawValue, bundle: nil)
    }
}
