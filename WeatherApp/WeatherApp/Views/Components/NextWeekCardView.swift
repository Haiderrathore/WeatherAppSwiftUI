//
//  NextWeekCardView.swift
//  WeatherApp
//
//  Created by Haider Rathore on 04/07/2024.
//

import SwiftUI

struct NextWeekCardView: View {
    var body: some View {
        VStack{
            
        Text("Wed 16")
            .font(.custom(AppConstants.FontName.medium, size: 14))
            .foregroundStyle(Color.white)
            .padding(.top, 20)
            
            Image(AppConstants.WeatherImages.night)
            .resizable()
            .scaledToFill()
            .frame(width: 55, height: 55)
            .offset(CGSize(width: 0, height: -10.0))
        
        Text("22°")
            .font(.custom(AppConstants.FontName.medium, size: 14))
            .foregroundStyle(Color.white)
            .padding(.top, -20)
        Text("1-5")
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

#Preview {
    NextWeekCardView()
}
