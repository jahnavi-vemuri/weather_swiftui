//
//  WeatherDetails.swift
//  weather_app
//
//  Created by Jahnavi Vemuri on 18/01/24.
//

import Foundation
import SwiftUI

struct WeatherDetails: View {
    let weatherData: WeatherResponse
    @Binding var isWeatherDetailsPresented: Bool
    
    var body: some View {
        LazyVStack {
            Image(uiImage: WeatherImageUtility.getImageForWeatherCondition(weatherData.weather.first?.main ?? "sunny") ?? UIImage(systemName: "sun.max.fill")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            
            Text(String(weatherData.name))
                .font(.system(size: 55))
                .fontWeight(.bold)
                .padding()
            
            Spacer().frame(height: 10)
            
            Text(String(format: "%.2f°C", weatherData.main.temp - 273.15))
                .font(.system(size: 40))
                .fontWeight(.bold)
                .padding()
            
            Text("\(weatherData.weather.first?.main ?? "")")
                .font(.system(size: 20))
                .padding()
            
            Spacer().frame(height: 20)
            
            NavigationLink(
                destination: WeatherDetailsView(
                    cityName: weatherData.name,
                    country: weatherData.sys.country,
                    latitude: weatherData.coord.lat,
                    longitude: weatherData.coord.lon,
                    windSpeed: weatherData.wind.speed,
                    pressure: Double(weatherData.main.pressure),
                    condition: weatherData.weather.first?.main ?? "sunny"
                ),
                isActive: $isWeatherDetailsPresented
            ) {
                EmptyView()
            }.hidden()
            
            Button(action: {
                isWeatherDetailsPresented.toggle()
            }) {
                Text("Know More")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            Spacer().frame(height: 20)
        }
    }
}
