//
//  SavedLocationsView.swift
//  WeatherApp
//
//  Created by Haider Rathore on 05/07/2024.
//

import SwiftUI

struct SavedLocationsView: View {
    var body: some View {
        ZStack{
            Image(AppConstants.Images.savedLocationsBg)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Text("Saved Locations")
                        .font(.custom(AppConstants.FontName.medium, size: 18))
                        .foregroundStyle(Color.white)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(AppConstants.Images.searchIcon)
                            .resizable()
                            .frame(width: 32,height: 32)
                    }
                   
                }
                .padding(.init(top: 60, leading: 30, bottom: 0, trailing: 20))
                
                
                ScrollView(.vertical, showsIndicators: false){
                    Spacer()
                        .frame(height: 10)
                    SavedLocationCard()
                    SavedLocationCard()
                    SavedLocationCard()
                    SavedLocationCard()
                    SavedLocationCard()
                    SavedLocationCard()
                    SavedLocationCard()
                    Spacer()
                        .frame(height: 40)
                }
                .padding(.top, 20)
                Spacer()
            }
        }
    }
}

#Preview {
    SavedLocationsView()
}
