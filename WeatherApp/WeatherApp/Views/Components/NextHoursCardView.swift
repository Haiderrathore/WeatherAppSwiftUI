//
//  NextWeekCardView.swift
//  WeatherApp
//
//  Created by Haider Rathore on 04/07/2024.
//

import SwiftUI

struct NextHoursCardView: View {
    let hourly: HourlyWeather
    var body: some View {
        VStack {
            Text(getHourlyTime(hourly.dt))
                .font(.custom(AppConstants.FontName.medium, size: 18))
                .foregroundStyle(Color.white)
                .padding(.top, 20)
            
            // Replace with appropriate weather icon based on day.weather.first?.icon
            Image(AppConstants.WeatherImages.night)
                .resizable()
                .scaledToFill()
                .frame(width: 55, height: 55)
                .offset(CGSize(width: 0, height: -10.0))
            
            Text("\(hourly.temp.toInt())°")
                .font(.custom(AppConstants.FontName.medium, size: 18))
                .foregroundStyle(Color.white)
                .padding(.top, -20)
            
            Text("\(hourly.wind_speed.toInt())")
                .font(.custom(AppConstants.FontName.medium, size: 18))
                .foregroundStyle(Color.white)
                .padding(.top, -3)
            
            Text("km/h")
                .font(.custom(AppConstants.FontName.medium, size: 16))
                .foregroundStyle(Color.white)
                .padding(.bottom)
        }
//        .background(.gray)
    }
    func getHourlyTime(_ timestamp: TimeInterval) -> String {
            let date = Date(timeIntervalSince1970: timestamp)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h a"
            return dateFormatter.string(from: date)
        }
}



#Preview {
    NextHoursCardView(hourly: HourlyWeather(dt: Date().timeIntervalSince1970, temp: 21, feels_like: 18, pressure: 1012, humidity: 12, dew_point: 51.2, uvi: 22.2, clouds: 16, visibility: 34, wind_speed: 23.5, wind_deg: 23, weather: [Weather(id: 801, main: WeatherCondition(rawValue: "Clouds")  ?? .Clouds , description: "few clouds", icon: "02d")], pop: 12.12))
}


