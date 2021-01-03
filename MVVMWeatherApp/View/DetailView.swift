//
//  DetailView.swift
//  MVVMWeatherApp
//
//  Created by Nirmal Mehra on 28/12/20.
//

import UIKit

class DetailView: UIView {
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var minTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var maxTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var humidityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Humidity"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pressureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pressureTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Air Pressure"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var windLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var windTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Wind"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var visibilityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var visibilityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Visibility"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setUpViews()
        //backgroundColor = UIColor(displayP3Red: 34/255, green: 36/255, blue: 49/255, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    private func setUpViews() {
        // Top Icon View
        addSubview(tempLabel)
        addSubview(minTempLabel)
        addSubview(maxTempLabel)
        addSubview(pressureLabel)
        addSubview(humidityLabel)
        addSubview(humidityTitleLabel)
        addSubview(pressureLabel)
        addSubview(pressureTitleLabel)
        addSubview(windLabel)
        addSubview(windTitleLabel)
        addSubview(visibilityLabel)
        addSubview(visibilityTitleLabel)
    }
    
    private func setUpConstraints() {
        let currentTempLabelConstraint = [
            tempLabel.topAnchor.constraint(equalTo: topAnchor, constant: 140),
            tempLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tempLabel.widthAnchor.constraint(equalToConstant: 180),
            tempLabel.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        let minTemperatureLabelConstraints = [
            minTempLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            minTempLabel.widthAnchor.constraint(equalToConstant: 100),
            minTempLabel.heightAnchor.constraint(equalToConstant: 40),
            minTempLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 50)
        ]
        
        let maxTemperatureLabelConstraints = [
            maxTempLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            maxTempLabel.widthAnchor.constraint(equalToConstant: 100),
            maxTempLabel.heightAnchor.constraint(equalToConstant: 40),
            maxTempLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 50)
        ]
        
        let humidityLabelConstraints = [
            humidityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            humidityLabel.widthAnchor.constraint(equalToConstant: 100),
            humidityLabel.heightAnchor.constraint(equalToConstant: 40),
            humidityLabel.topAnchor.constraint(equalTo: minTempLabel.bottomAnchor, constant: 30)
        ]
        
        let humidityTitleLabelConstraints = [
            humidityTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            humidityTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            humidityTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            humidityTitleLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: 10)
        ]
        
        let pressureLabelConstraints = [
            pressureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            pressureLabel.widthAnchor.constraint(equalToConstant: 100),
            pressureLabel.heightAnchor.constraint(equalToConstant: 40),
            pressureLabel.topAnchor.constraint(equalTo: maxTempLabel.bottomAnchor, constant: 30)
        ]
        
        let pressureTitleLabelConstraints = [
            pressureTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            pressureTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            pressureTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            pressureTitleLabel.topAnchor.constraint(equalTo: pressureLabel.bottomAnchor, constant: 10)
        ]
        
        let windLabelConstraints = [
            windLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            windLabel.widthAnchor.constraint(equalToConstant: 100),
            windLabel.heightAnchor.constraint(equalToConstant: 40),
            windLabel.topAnchor.constraint(equalTo: humidityTitleLabel.bottomAnchor, constant: 30)
        ]
        
        let windTitleLabelConstraints = [
            windTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            windTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            windTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            windTitleLabel.topAnchor.constraint(equalTo: windLabel.bottomAnchor, constant: 10)
        ]
        
        let visibilityLabelConstraints = [
            visibilityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            visibilityLabel.widthAnchor.constraint(equalToConstant: 100),
            visibilityLabel.heightAnchor.constraint(equalToConstant: 40),
            visibilityLabel.topAnchor.constraint(equalTo: pressureTitleLabel.bottomAnchor, constant: 30)
        ]
        
        let visibilityTitleLabelConstraints = [
            visibilityTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            visibilityTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            visibilityTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            visibilityTitleLabel.topAnchor.constraint(equalTo: visibilityLabel.bottomAnchor, constant: 10)
        ]
        
        [
            currentTempLabelConstraint, minTemperatureLabelConstraints,
            maxTemperatureLabelConstraints, humidityLabelConstraints,
            pressureLabelConstraints, humidityTitleLabelConstraints,
            pressureTitleLabelConstraints, windLabelConstraints,
            windTitleLabelConstraints, visibilityLabelConstraints,
            visibilityTitleLabelConstraints
        ]
        .forEach(NSLayoutConstraint.activate(_:))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createGradient()
        setUpConstraints()
    }
    
    private func createGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.orange.cgColor, UIColor.yellow.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 1)
        gradient.endPoint = CGPoint(x: 0.5, y: 0)
        layer.insertSublayer(gradient, at: 0)
    }
}
