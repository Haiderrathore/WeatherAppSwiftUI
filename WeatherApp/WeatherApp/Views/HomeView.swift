//
//  HomeView.swift
//  WeatherApp
//
//  Created by Haider Rathore on 04/07/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
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
                        
                    } label: {
                        Image(AppConstants.Images.moreIcon)
                            .resizable()
                            .frame(width: 32, height: 32)
                        
                    }
                    .padding()
                }
                .padding(.horizontal, 15)
                Spacer()
                Text("JUNE 07")
                    .font(.custom(AppConstants.FontName.medium, size: 40))
                    .foregroundStyle(Color.white)
                
                HStack {
                    Text("Updated  ")
                        .font(.custom(AppConstants.FontName.light, size: 16))
                        .foregroundStyle(Color.white)
                    
                    Text("6/7/2024 4:55 PM")
                        .font(.custom(AppConstants.FontName.light, size: 16))
                        .foregroundStyle(Color.white)
                }
                
                Image(AppConstants.WeatherImages.night)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180,height: 120)
                
                Text("Clear")
                    .font(.custom(AppConstants.FontName.bold, size: 40))
                    .foregroundStyle(Color.white)
                
                HStack (alignment: .top, spacing: 1){
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
                
                Spacer()
                HStack{
                    VStack{
                        Image(AppConstants.Images.humidityIcon)
                        Text("HUMIDITY")
                            .font(.custom(AppConstants.FontName.medium, size: 14))
                            .foregroundStyle(Color.white)
                            .offset(CGSize(width: 0, height: -4))
                        Text("56%")
                            .font(.custom(AppConstants.FontName.medium, size: 14))
                            .foregroundStyle(Color.white)
                        
                    }
                    Spacer()
                    VStack{
                        Image(AppConstants.Images.windIcon)
                        Text("WIND")
                            .font(.custom(AppConstants.FontName.medium, size: 14))
                            .foregroundStyle(Color.white)
                            .offset(CGSize(width: 0, height: -4))
                        Text("4.63km/h")
                            .font(.custom(AppConstants.FontName.medium, size: 14))
                            .foregroundStyle(Color.white)
                    }
                    Spacer()
                    VStack{
                        Image(AppConstants.Images.tempratureIcom)
                        Text("FEELS LIKE")
                            .font(.custom(AppConstants.FontName.medium, size: 14))
                            .foregroundStyle(Color.white)
                            .offset(CGSize(width: 0, height: -4))
                        Text("22°")
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
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .center, spacing: 38){
                            NextWeekCardView()
                            NextWeekCardView()
                            NextWeekCardView()
                            NextWeekCardView()
                            NextWeekCardView()
                            NextWeekCardView()
                        }
                    }
                    .padding(.horizontal, 45)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
