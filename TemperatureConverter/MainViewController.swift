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
        view.image = UIImage(named: "normal")
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
        label.text = "0°F"
        return label
    }()
    
    private lazy var farhLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.text = "32°F"
        return label
    }()
    
    private lazy var tempSLider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(scrolling), for: .allEditingEvents)
        return slider
    }()
    
    @objc
    private func scrolling() {
        
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
