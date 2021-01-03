//
//  DetailViewController.swift
//  MVVMWeatherApp
//
//  Created by Nirmal Mehra on 28/12/20.
//

import UIKit
import Combine

class DetailViewController: UIViewController {
    let city: String
    let detailView = DetailView()
    let detailViewModel: DetailViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(city: String) {
        self.city = city
        detailViewModel = DetailViewModel(cityName: city)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = detailView
        title = "Today's Weather"
        bindViewModelToView()
        detailViewModel.fetchWeather()
    }
    
    func bindViewModelToView() {
        detailViewModel.$weatherData
            .receive(on: RunLoop.main)
            .sink { (val) in
                guard let temperature = val.first?.main.temp,
                      let minTemperature = val.first?.main.tempMin,
                      let maxTemperature = val.first?.main.tempMax,
                      let humdity = val.first?.main.humidity,
                      let pressure = val.first?.main.pressure,
                      let windSpeed = val.first?.wind.speed,
                      let visibility = val.first?.visibility else {
                    return
                }
                self.detailView.tempLabel.text = String(temperature) + "\u{00B0}" + "C"
                self.detailView.minTempLabel.text = String(minTemperature) + "\u{00B0}" + "C"
                self.detailView.maxTempLabel.text = String(maxTemperature) + "\u{00B0}" + "C"
                self.detailView.humidityLabel.text = String(humdity) + "%"
                self.detailView.pressureLabel.text = String(pressure) + " hPa"
                self.detailView.windLabel.text = String(windSpeed) + " Km/h"
                self.detailView.visibilityLabel.text = String(visibility / 1000) + " Km"
            }
            .store(in: &bindings)
    }
}


//▿ 1 element
//  ▿ 0 : Weather
//    ▿ coord : Coord
//      - lon : 8.55
//      - lat : 47.37
//    ▿ weather : 1 element
//      ▿ 0 : WeatherElement
//        - id : 804
//        - main : "Clouds"
//        - weatherDescription : "overcast clouds"
//        - icon : "04n"
//    - base : "stations"
//    ▿ main : Main
//      - temp : 275.73
//      - feelsLike : 271.82
//      - tempMin : 274.82
//      - tempMax : 276.15
//      - pressure : 1006
//      - humidity : 93
//    - visibility : 10000
//    ▿ wind : Wind
//      - speed : 3.1
//      - deg : 140
//    ▿ clouds : Clouds
//      - all : 90
//    - dt : 1609345656
//    ▿ sys : Sys
//      - type : 1
//      - id : 6932
//      - country : "CH"
//      - sunrise : 1609312379
//      - sunset : 1609343019
//    - timezone : 3600
//    - id : 2657896
//    - name : "Zurich"
//    - cod : 200
