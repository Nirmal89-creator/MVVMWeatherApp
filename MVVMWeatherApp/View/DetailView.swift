//
//  DetailView.swift
//  MVVMWeatherApp
//
//  Created by Nirmal Mehra on 28/12/20.
//

import UIKit

class DetailView: UIView {
    
    lazy var iconImageView: UIImageView = {
       let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: "sun.max.fill")
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.tintColor = .orange
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        return iconImageView
    }()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        //label.font = .systemFont(ofSize: 20)
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 25)
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
        addSubview(iconImageView)
        addSubview(tempLabel)
        addSubview(minTempLabel)
        addSubview(maxTempLabel)
    }
    
    private func setUpConstraints() {
        let iconImageConstraint = [
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            iconImageView.widthAnchor.constraint(equalToConstant: 120),
            iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 120)
        ]
        
        let currentTempLabelConstraint = [
            tempLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 50),
            tempLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tempLabel.widthAnchor.constraint(equalToConstant: 100),
            tempLabel.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        let minTemperatureLabelConstraints = [
            minTempLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            minTempLabel.widthAnchor.constraint(equalToConstant: 100),
            minTempLabel.heightAnchor.constraint(equalToConstant: 40),
            minTempLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 20)
        ]
        
        let maxTemperatureLabelConstraints = [
            maxTempLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            maxTempLabel.widthAnchor.constraint(equalToConstant: 100),
            maxTempLabel.heightAnchor.constraint(equalToConstant: 40),
            maxTempLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 20)
        ]
        
        [iconImageConstraint, currentTempLabelConstraint, minTemperatureLabelConstraints, maxTemperatureLabelConstraints]
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
