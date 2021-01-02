//
//  WeatherService.swift
//  MVVMWeatherApp
//
//  Created by Nirmal Mehra on 29/12/20.
//

import Foundation
import Combine

class WeatherService {
    
    let city: String
    let unit = "metric"
    let apiKey = "ff0dc3efab4b9d46043d78cd2594e974"
    let baseUrl = "http://api.openweathermap.org/data/2.5/weather?"
    
    init(city: String) {
        self.city = city
    }
    
    func fetchWeatherData() -> AnyPublisher<Weather, Error> {
        // Service call
        let query: String = "q=\(city)&units=\(unit)&appid=\(apiKey)"
        let requestUrl = URL(string: baseUrl + query)
        
        var fetchDataTask: URLSessionDataTask?
        
        return Future<Weather, Error> { promise in
            fetchDataTask = URLSession.shared.dataTask(with: requestUrl!, completionHandler: { (data, response, error) in
                guard let data = data else {
                    return
                }
                
                do {
                    let players = try JSONDecoder().decode(Weather.self, from: data)
                    promise(.success(players))
                } catch {
                    print(error.localizedDescription)
                }
            })
            fetchDataTask?.resume()
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

