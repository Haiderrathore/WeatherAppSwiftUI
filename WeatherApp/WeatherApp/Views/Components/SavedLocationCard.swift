//
//  SavedLocationCard.swift
//  WeatherApp
//
//  Created by Haider Rathore on 05/07/2024.
//

import SwiftUI

struct SavedLocationCard: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.getThemeColor(color: .homeSubbg).opacity(0.6))
                .frame(width: 345, height: 153)
            VStack{
                HStack {
                    VStack (alignment: .leading, spacing: 7) {
                        Text("Paris")
                            .font(.custom(AppConstants.FontName.bold, size: 24))
                            .foregroundStyle(Color.white)
                        Text("Clear")
                            .font(.custom(AppConstants.FontName.medium, size: 16))
                            .foregroundStyle(Color.white)
                    }.padding(.top, 14)
                    
                    Spacer()
                    
                    Image(AppConstants.WeatherImages.night)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80,height: 80)
                }
                .padding(.horizontal, 60)
                                
                HStack {
                    VStack (alignment: .leading, spacing: 7) {
                        HStack{
                            Text("Humidity")
                                .font(.custom(AppConstants.FontName.light, size: 16))
                                .foregroundStyle(Color.white)
                            Text("56%")
                                .font(.custom(AppConstants.FontName.medium, size: 16))
                                .foregroundStyle(Color.white)
                                .padding(.leading, -5)
                        }
                       
                        HStack{
                            Text("Wind")
                                .font(.custom(AppConstants.FontName.light, size: 16))
                                .foregroundStyle(Color.white)
                            Text("4.12km/h")
                                .font(.custom(AppConstants.FontName.medium, size: 16))
                                .foregroundStyle(Color.white)
                                .padding(.leading, -5)
                        }
                    }
                    
                    Spacer()
                    
                    HStack (alignment: .top, spacing: 1){
                        Text("24")
                            .font(.custom(AppConstants.FontName.medium, size: 48))
                            .foregroundStyle(Color.white)
                        Text("°C")
                            .font(.custom(AppConstants.FontName.bold, size: 24))
                            .foregroundStyle(Color.white)
                            .padding(.top, 6)
                    }
                    .padding(.leading)
                    .offset(CGSize(width: 0, height: -12))

                }
                .padding(.init(top: 6, leading: 60, bottom: 15, trailing: 60))
            }
        }
    }
}

#Preview {
    SavedLocationCard()
}
