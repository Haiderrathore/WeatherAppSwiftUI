//
//  ContentView.swift
//  WeatherApp
//
//  Created by Haider Rathore on 04/07/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
           HomeView()
                .environmentObject(locationManager)
        }
    }
}

#Preview {
    ContentView()
}
