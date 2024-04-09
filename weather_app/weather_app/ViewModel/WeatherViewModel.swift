//
//  WeatherViewModel.swift
//  weather_app
//
//  Created by Jahnavi Vemuri on 22/03/24.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherResponse?
    @Published var searchText: String = ""
    @Published var isWeatherDetailsPresented = false
    
    func fetchWeatherData() {
        let cityToFetch = searchText.isEmpty ? "Chennai" : searchText
        WeatherNetworkManager.shared.fetchWeather(city: cityToFetch) { result in
            switch result {
            case .success(let weatherResponse):
                DispatchQueue.main.async {
                    self.weatherData = weatherResponse
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

