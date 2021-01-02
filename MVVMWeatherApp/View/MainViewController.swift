//
//  ViewController.swift
//  MVVMWeatherApp
//
//  Created by Nirmal Mehra on 26/12/20.
//

import UIKit
import Foundation
import Combine

class MainViewController: UIViewController {
    
    let mainView = MainView()
    private let mainViewModel = MainViewModel()
    var cancellables = Set<AnyCancellable>()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        view = mainView
        title = "Weather App"
        setUpTableViews()
        bindViewModelToView()
    }
    
    func bindViewModelToView() {
        let listHandler: ([String]) -> Void = { [weak self] _ in
            self?.mainView.cityListTableView.reloadData()
        }
        
        mainViewModel.$cityNames
            .receive(on: RunLoop.main)
            .sink(receiveValue: listHandler)
            .store(in: &cancellables)
    }
    
    private func setUpTableViews() {
        mainView.cityListTableView.register(CityTableViewCell.self, forCellReuseIdentifier: CityTableViewCell.identifier)
        mainView.cityListTableView.dataSource = self
        mainView.cityListTableView.delegate = self
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel.cityNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath)
        
        guard let cityCell = dequeuedCell as? CityTableViewCell else {
            fatalError("Could not dequeue a cell")
        }
        
        cityCell.nameLabel.text = mainViewModel.cityNames[indexPath.row]
        
        return cityCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Requires API call to fetch weather and navigate to next page
        let citySelected = mainViewModel.cityNames[indexPath.row]
        self.navigationController?.pushViewController(DetailViewController(city: citySelected), animated: false)
    }
    
}


