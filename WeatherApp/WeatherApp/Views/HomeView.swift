//
//  HomeView.swift
//  WeatherApp
//
//  Created by Haider Rathore on 04/07/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var cities: CityResponse?
    
    
    var body: some View {
        ZStack {
            Image(AppConstants.Images.bgPlaceholder)
                .resizable()
                .ignoresSafeArea()
            Image(AppConstants.Images.darkening)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    HStack {
                        Image(AppConstants.Images.locationIcon)
                            .resizable()
                            .frame(width: 32, height: 32)
                        
                        Text("Paris")
                            .font(.custom(AppConstants.FontName.medium, size: 18))
                            .foregroundStyle(Color.white)
                    }
                    .padding()
                    
                    Spacer()
                    Button {
                        // Action for the button
                    } label: {
                        Image(AppConstants.Images.moreIcon)
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    .padding()
                }
                .padding(.horizontal, 15)
                
                Spacer()
                
//                if viewModel.isLoading {
//                    ProgressView()
//                } else if let weather = viewModel.response {
                    VStack {
                        Text("JULY 07")
                            .font(.custom(AppConstants.FontName.medium, size: 40))
                            .foregroundStyle(Color.white)
                        
                        HStack {
                            Text("Updated  ")
                                .font(.custom(AppConstants.FontName.light, size: 16))
                                .foregroundStyle(Color.white)
                            
//                            Text("Date(timeIntervalSince1970: weather.current.dt).formatted()")
                            Text("4/5/66")
                                .font(.custom(AppConstants.FontName.light, size: 16))
                                .foregroundStyle(Color.white)
                        }
                        
                        Image(AppConstants.WeatherImages.night)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 120)
                        
//                        Text(weather.current.weather.first?.description.capitalized ?? "N/A")
                        Text("CLEAR")
                            .font(.custom(AppConstants.FontName.bold, size: 40))
                            .foregroundStyle(Color.white)
                        
                        HStack(alignment: .top, spacing: 1) {
//                            Text("\(Int(weather.current.temp))")
                            Text("24")
                                .font(.custom(AppConstants.FontName.medium, size: 86))
                                .foregroundStyle(Color.white)
                            Text("°C")
                                .font(.custom(AppConstants.FontName.medium, size: 24))
                                .foregroundStyle(Color.white)
                                .padding(.top, 12)
                        }
                        .padding(.leading)
                        .offset(CGSize(width: 0, height: -25))
                    }
                    
                    Spacer()
                    
                    HStack {
                        VStack {
                            Image(AppConstants.Images.humidityIcon)
                            Text("HUMIDITY")
                                .font(.custom(AppConstants.FontName.medium, size: 14))
                                .foregroundStyle(Color.white)
                                .offset(CGSize(width: 0, height: -4))
//                            Text("\(weather.current.humidity)%")
                            Text("44%")
                                .font(.custom(AppConstants.FontName.medium, size: 14))
                                .foregroundStyle(Color.white)
                        }
                        Spacer()
                        VStack {
                            Image(AppConstants.Images.windIcon)
                            Text("WIND")
                                .font(.custom(AppConstants.FontName.medium, size: 14))
                                .foregroundStyle(Color.white)
                                .offset(CGSize(width: 0, height: -4))
//                            Text("\(weather.current.wind_speed) km/h")
                            Text("33 km/h")
                                .font(.custom(AppConstants.FontName.medium, size: 14))
                                .foregroundStyle(Color.white)
                        }
                        Spacer()
                        VStack {
                            Image(AppConstants.Images.tempratureIcon)
                            Text("FEELS LIKE")
                                .font(.custom(AppConstants.FontName.medium, size: 14))
                                .foregroundStyle(Color.white)
                                .offset(CGSize(width: 0, height: -4))
//                            Text("\(Int(weather.current.feels_like))°")
                            Text("20°")
                                .font(.custom(AppConstants.FontName.medium, size: 14))
                                .foregroundStyle(Color.white)
                        }
                    }
                    .padding(.horizontal, 35)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.getThemeColor(color: .homeSubbg).opacity(0.6))
                            .frame(width: 345, height: 153)
                            .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .center, spacing: 38) {
//                                ForEach(weather.daily, id: \.dt) { day in
//                                    NextWeekCardView(day: day)
                                    NextWeekCardView()
                                    NextWeekCardView()
                                    NextWeekCardView()
                                    NextWeekCardView()
                                    NextWeekCardView()
                                    NextWeekCardView()
                                    NextWeekCardView()
//                                }
                            }
                        }
                        .padding(.horizontal, 45)
                    }
//                } else if let error = viewModel.errorMessage {
//                    Text(error)
//                        .foregroundStyle(Color.red)
//                }
                
                Spacer()
            }
        }
        .onAppear {
            viewModel.fetchWeather(lat: 51.5072, lon: 0.1276) // Islamabad coordinates
        }
    }
}

#Preview {
    HomeView()
}
