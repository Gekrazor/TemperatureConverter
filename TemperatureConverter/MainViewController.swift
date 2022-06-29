//
//  ViewController.swift
//  TemperatureConverter
//
//  Created by Дмитрий Лещук on 15.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "cold")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.text = "Temperature Converter"
        return label
    }()
    
    private lazy var celcLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.text = "0ºC"
        return label
    }()
    
    private lazy var farhLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.text = "32ºF"
        return label
    }()
    
    private lazy var tempSLider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(scrolling), for: .allTouchEvents)
        slider.value = 0
        slider.maximumValue = 50
        slider.minimumValue = -50
        return slider
    }()
    
    @objc
    private func scrolling() {
        let currentValue = round(tempSLider.value)
        celcLabel.text = "\(currentValue)ºC"
        farhLabel.text = "\(currentValue * 9 / 5 + 32)ºF"
        
        if currentValue == 30 {
            UIView.transition(with: backgroundImageView,
                              duration: 0.4,
                              options: .transitionCrossDissolve,
                              animations: { self.backgroundImageView.image = UIImage(named: "hot") },
                              completion: nil)
        }
        
        if currentValue == 0 {
            UIView.transition(with: backgroundImageView,
                              duration: 0.4,
                              options: .transitionCrossDissolve,
                              animations: { self.backgroundImageView.image = UIImage(named: "cold") },
                              completion: nil)
        }
        
        if currentValue == 29 || currentValue == 1 {
            UIView.transition(with: backgroundImageView,
                              duration: 0.4,
                              options: .transitionCrossDissolve,
                              animations: { self.backgroundImageView.image = UIImage(named: "normal") },
                              completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    private func layout() {
        [backgroundImageView, titleLabel, celcLabel, tempSLider, farhLabel].forEach { view.addSubview($0) }
        
        let inset: CGFloat = 32
        
        NSLayoutConstraint.activate([
            // titleLabel
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: inset),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // backgroundImageView
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: inset),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 300),
            backgroundImageView.widthAnchor.constraint(equalToConstant: 300),
            
            // celcLabel
            celcLabel.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: inset),
            celcLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            celcLabel.heightAnchor.constraint(equalToConstant: 24),
            
            // tempSlider
            tempSLider.topAnchor.constraint(equalTo: celcLabel.bottomAnchor, constant: inset),
            tempSLider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            tempSLider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            
            // farhLabel
            farhLabel.topAnchor.constraint(equalTo: tempSLider.bottomAnchor, constant: inset),
            farhLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
}
