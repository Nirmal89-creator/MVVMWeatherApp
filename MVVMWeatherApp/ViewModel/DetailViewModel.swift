//
//  DetailViewModel.swift
//  MVVMWeatherApp
//
//  Created by Nirmal Mehra on 29/12/20.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var weatherData = [Weather]()
    private let cityName: String
    private let weatherService: WeatherService
    private var bindings = Set<AnyCancellable>()
    
    init(cityName: String) {
        self.cityName = cityName
        self.weatherService = WeatherService(city: self.cityName)
    }
    
    func fetchWeather() {
        
        let handler: (Subscribers.Completion<Error>) -> Void = { _ in
            
        }
        
        let completionHandler: (Weather) -> Void = { value in
            self.weatherData = [value]
        }
        
        weatherService.fetchWeatherData()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: handler, receiveValue: completionHandler)
            .store(in: &bindings)
    }
        
}
