//
//  WeatherNetworkManager.swift
//  weather_app
//
//  Created by Jahnavi Vemuri on 10/01/24.
//

import Alamofire

class WeatherNetworkManager {
    static let shared = WeatherNetworkManager()
    
    private init() {}
    
    func fetchWeather(city: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        let apiKey = "d294bd9ecf88bf952b8fc507eade15d8"
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        
        AF.request(url).responseDecodable(of: WeatherResponse.self) { response in
            switch response.result {
            case .success(let weatherResponse):
                completion(.success(weatherResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
