//
//  MainViewModel.swift
//  MVVMWeatherApp
//
//  Created by Nirmal Mehra on 27/12/20.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    
    @Published var cityNames: [String] = []
    
    let cityList = ["Tokyo", "Chicago", "Delhi", "Paris", "Zurich", "Berlin", "Moscow", "New York", "London", "Miami"]
    
    init() {
        getList()
    }
    
    func getList() {
        self.cityNames = cityList
    }
}
