//
//  SavedLocationsView.swift
//  WeatherApp
//
//  Created by Haider Rathore on 05/07/2024.
//

import SwiftUI

struct SavedLocationsView: View {
    @State private var cityResponse: Cities?
    @State private var viewModel = WeatherViewModel()
    @State private var showSearchBar = false
    @State private var searchText = ""
    
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
                        ForEach(filteredCities) { city in
                            SavedLocationCard(
                                city: city.city,
                                weatherDescription: "Clear",
                                humidity: 56,
                                windSpeed: 1.22,
                                temperature: 24,
                                weatherImageName: AppConstants.WeatherImages.night
                            )
                            .onTapGesture {
                                withAnimation(.bouncy(extraBounce: 0.1)){
                                    showSearchBar = false
                                }
                                UIApplication.shared.endEditing()
                            }
                        }
                        
                        Spacer()
                            .frame(height: 40)
                    }
                    .padding(.top, 20)
                    .onAppear {
                        if let loadedCities: Cities = loadJson(filename: "cities") {
                            self.cityResponse = loadedCities
                        }
                    }
                    
                    Spacer()
                }
            }
        }
    }
    
    var filteredCities: [CityResponse] {
        if let cities = cityResponse?.cities {
            let filtered = searchText.isEmpty ? cities : cities.filter { $0.city.lowercased().contains(searchText.lowercased()) }
            return filtered.sorted { $0.city.lowercased() < $1.city.lowercased() }
        }
        return []
    }
}

#Preview {
    SavedLocationsView()
}
