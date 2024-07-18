//
//  SavedLocationsView.swift
//  WeatherApp
//
//  Created by Haider Rathore on 05/07/2024.
//

import SwiftUI

struct SavedLocationsView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var showSearchBar = false
    @State private var searchText = ""
    @Binding var selectedCityResponse: CityResponse?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        ZStack{
            Image(AppConstants.Images.savedLocationsBg)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(.bouncy(extraBounce: 0.1)){
                        showSearchBar = false
                    }
                    UIApplication.shared.endEditing()
                }
            
            VStack {
                VStack {
                    HStack{
                        Text("Saved Locations")
                            .font(.custom(AppConstants.FontName.medium, size: 18))
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                        
                        Button {
                            withAnimation(.bouncy(extraBounce: 0.1)){
                                showSearchBar.toggle()
                                
                            }
                        } label: {
                            Image(AppConstants.Images.searchIcon)
                                .resizable()
                                .frame(width: 32,height: 32)
                        }
                    }
                    .padding(.init(top: 60, leading: 30, bottom: 0, trailing: 20))
                    
                    if showSearchBar {
                        TextField("Search", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 30)
                            .padding(.top, 10)
                        
                    }
                }
                VStack{
                    
                    ScrollView(.vertical, showsIndicators: false){
                        Spacer()
                            .frame(height: 10)
                        ForEach(viewModel.cities) { city in
                            let weatherData = city.weather?.current.weather.first
                 
//                            NavigationLink(destination: HomeView(cityName: city.city)) {
//
                                SavedLocationCard(
                                    city: city.city,
                                    weatherDescription: weatherData?.main.rawValue ?? "",
                                    humidity: city.weather?.current.humidity ?? 0,
                                    windSpeed: city.weather?.current.wind_speed ?? 0,
                                    temperature: city.weather?.current.temp ?? 0,
                                    weatherImageName: AppConstants.WeatherImages.night
                                )
                                .onTapGesture {
                                    saveCityToUserDefaults(city.city)
                                    selectedCityResponse = city
                                    withAnimation(.bouncy(extraBounce: 0.1)){
                                        showSearchBar = false
                                    }
                                    UIApplication.shared.endEditing()
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
                        
                        Spacer()
                            .frame(height: 40)
                    }
                    .padding(.top, 20)
                    .onAppear {
                        viewModel.loadCitiesData()
                    }
                    
                    Spacer()
                }
            }
        }
    }

    private func saveCityToUserDefaults(_ cityName: String) {
        UserDefaults.standard.set(cityName, forKey: "SelectedCity")
        UserDefaults.standard.synchronize()
    }

    func HomeViewNavigation() {

    }


//#Preview {
//    SavedLocationsView(selectedCity: sel)
//}
