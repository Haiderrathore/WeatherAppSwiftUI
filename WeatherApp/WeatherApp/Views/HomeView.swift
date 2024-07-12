//
//  HomeView.swift
//  WeatherApp
//
//  Created by Haider Rathore on 04/07/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var cityResponse: CityResponse?
    
    var body: some View {
        NavigationStack{
            ZStack {
                //                Image(AppConstants.Images.bgPlaceholder)
                //                    .resizable()
                //                    .ignoresSafeArea()
                AsyncImage(url: URL(string: cityResponse?.imageUrl ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300)
                        .ignoresSafeArea()
                } placeholder: {
                    ProgressView()
                }
                
                Image(AppConstants.Images.darkening)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    HStack {
                        HStack {
                            Image(AppConstants.Images.locationIcon)
                                .resizable()
                                .frame(width: 32, height: 32)
                            
                            Text(cityResponse?.city ?? "Not Avalible")
                                .font(.custom(AppConstants.FontName.medium, size: 18))
                                .foregroundStyle(Color.white)
                        }
                        .padding()
                        
                        Spacer()
                        NavigationLink {
                            SavedLocationsView()
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
                        Text(getFormattedDate())
                            .font(.custom(AppConstants.FontName.medium, size: 40))
                            .foregroundStyle(Color.white)
                        
                        HStack {
                            Text("Updated as of \(getCurrentDateTime())")
                                .font(.custom(AppConstants.FontName.light, size: 16))
                                .foregroundStyle(Color.white)
                        }
                        
                        Image(AppConstants.WeatherImages.night)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 120)
                        
                        Text(viewModel.weatherResponse?.current.weather.first?.description.capitalized ?? "Not Avalible")
                            .font(.custom(AppConstants.FontName.bold, size: 40))
                            .foregroundStyle(Color.white)
                        
                        HStack(alignment: .top, spacing: 1) {
                            Text(viewModel.weatherResponse?.current.temp.rounded().toInt().toString() ?? "00")
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
                            Text(viewModel.weatherResponse?.current.humidity.toString() ?? "00" )
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
                            Text(viewModel.weatherResponse?.current.wind_speed.rounded().toInt().toString() ?? "00" )
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
                            Text(viewModel.weatherResponse?.current.feels_like.rounded().toInt().toString() ?? "00" )
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
                                ForEach(viewModel.weatherResponse?.hourly.prefix(10) ?? [], id: \.self) {  hourly in
                                    
                                    NextHoursCardView(hourly: hourly)
                                    
                                }
                            }
                        }
                        .padding(.horizontal, 45)
                    }
                    
                    Spacer()
                }
            }
            .onAppear {
                if let loadedCities: Cities = loadJson(filename: "cities") {
                    self.cityResponse = loadedCities.cities.first
                }
                viewModel.fetchWeather(lat: 40.7128, lon: -74.0060)// Newyork
//                viewModel.fetchWeather(lat: 29.7604, lon: -95.3698)// Huston
//                viewModel.fetchWeather(lat: 19.07609, lon: -72.877426)// Mumbai
//                viewModel.fetchWeather(lat: 55.755825, lon: -37.617298)// Moscow
//                viewModel.fetchWeather(lat: 33.6844, lon: -73.0479)// Islamabad
            }
        }
    }
    
    
    func getCurrentDateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d/yyyy h:mm a"
        return dateFormatter.string(from: Date())
    }
    
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        let dateString = dateFormatter.string(from: Date())
        return dateString.uppercased()
    }
    
    
    
}

#Preview {
    HomeView()
}
