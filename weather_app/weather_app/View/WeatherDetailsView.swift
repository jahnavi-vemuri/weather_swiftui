//
//  WeatherDetailsView.swift
//  weather_app
//
//  Created by Jahnavi Vemuri on 10/01/24.
//

import SwiftUI

struct WeatherDetailsView: View {
    @State private var isBottomSheetPresented = false
    let cityName: String
    let country: String
    let latitude: Double
    let longitude: Double
    let windSpeed: Double
    let pressure: Double
    let condition: String
    
    var body: some View {
        NavigationView {
            ZStack {
                WeatherMapView(latitude: latitude, longitude: longitude)
                    .overlay(
                        Image(uiImage: WeatherImageUtility.getImageForWeatherCondition(condition) ?? UIImage(systemName: "sun.max.fill")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .offset(y: -15)
                            .onTapGesture {
                                isBottomSheetPresented.toggle()
                            }
                    )
            }
            .bottomSheet(isPresented: $isBottomSheetPresented) {
                BottomSheetContent(
                    latitude: latitude,
                    longitude: longitude,
                    windSpeed: windSpeed,
                    pressure: pressure,
                    sheetHeight: UIScreen.main.bounds.height / 6
                )
            }
            .navigationTitle("\(cityName), \(country)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WeatherDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsView(
            cityName: "San Francisco",
            country: "USA",
            latitude: 37.7749,
            longitude: -122.4194,
            windSpeed: 5.0,
            pressure: 1015.0,
            condition: "sunny"
        )
    }
}

