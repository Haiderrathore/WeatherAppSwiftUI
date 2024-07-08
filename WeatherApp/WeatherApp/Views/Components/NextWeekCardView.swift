//
//  NextWeekCardView.swift
//  WeatherApp
//
//  Created by Haider Rathore on 04/07/2024.
//

import SwiftUI

struct NextWeekCardView: View {
    let day: DailyWeather

    var body: some View {
        VStack {
            Text(Date(timeIntervalSince1970: day.dt).formatted(.dateTime.weekday(.short)))
                .font(.custom(AppConstants.FontName.medium, size: 14))
                .foregroundStyle(Color.white)
                .padding(.top, 20)
            
            // Replace with appropriate weather icon based on day.weather.first?.icon
            Image(AppConstants.WeatherImages.night)
                .resizable()
                .scaledToFill()
                .frame(width: 55, height: 55)
                .offset(CGSize(width: 0, height: -10.0))
            
            Text("\(Int(day.temp.day))°")
                .font(.custom(AppConstants.FontName.medium, size: 14))
                .foregroundStyle(Color.white)
                .padding(.top, -20)
            
            Text("\(Int(day.wind_speed))")
                .font(.custom(AppConstants.FontName.medium, size: 10))
                .foregroundStyle(Color.white)
                .padding(.top, 1)
            
            Text("km/h")
                .font(.custom(AppConstants.FontName.medium, size: 10))
                .foregroundStyle(Color.white)
                .padding(.bottom)
        }
    }
}

extension DailyWeather {
    static var sample: DailyWeather {
        DailyWeather(
            dt: Date().timeIntervalSince1970,
            sunrise: Date().timeIntervalSince1970,
            sunset: Date().timeIntervalSince1970,
            temp: Temperature(day: 26.0, min: 16.0, max: 26.0, night: 18.0, eve: 20.0, morn: 16.0),
            feels_like: FeelsLike(day: 21.0, night: 17.0, eve: 19.0, morn: 15.0),
            pressure: 1013,
            humidity: 60,
            dew_point: 12.0,
            wind_speed: 5.0,
            wind_deg: 180,
            weather: [Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")],
            clouds: 0,
            pop: 0.0,
            rain: nil
        )
    }
}
#Preview {
    NextWeekCardView(day: DailyWeather.sample)
}
