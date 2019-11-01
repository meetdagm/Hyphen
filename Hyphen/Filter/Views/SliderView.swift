//
//  SliderView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/19/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class SliderView: CardView {
    
    var separator: String = "+"
    
    var currentValue: Float? {
        didSet {
            if let value = currentValue {
                sliderValue.text = separator + format(number: Int(value))
            }
        }
    }
    
    var minValue: Float? {
        didSet {
            if let value = minValue {
                minValueLabel.text = format(number: Int(value))
                slider.minimumValue = value
            }            
        }
    }
    
    var maxValue: Float? {
        didSet {
            if let value = maxValue {
                maxValueLabel.text = format(number: Int(value))
                slider.maximumValue = value
            }
        }
    }
    
    var title: String? {
        didSet {
            sliderTitle.text = title
        }
    }
    
    let sliderTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bedrooms: "
        label.font = UIFont(name: FontConfig.regular, size: 14)
        label.textColor = .black
        
        return label
    }()
    
    let sliderValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+3"
        label.font = UIFont(name: FontConfig.demiBold, size: 14)
        label.textColor = .black
        
        return label
    }()
    
    let slider: UISlider = {
       
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.thumbTintColor = .black
        slider.minimumTrackTintColor = .black
        slider.maximumTrackTintColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 247/255)
        let circleImage = slider.makeCircleWith(size: CGSize(width: 15, height: 15), backgroundColor: .black)
        slider.setThumbImage(circleImage, for: .normal)
        slider.setThumbImage(circleImage, for: .highlighted)
        
        return slider
    }()
    
    let minValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.font = UIFont(name: FontConfig.regular, size: 14)
        label.textColor = .black
        
        return label
    }()
    
    let maxValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.font = UIFont(name: FontConfig.regular, size: 14)
        label.textColor = .black
        
        return label
    }()
    
    override func setupView() {
        super.setupView()
        
        addSubview(sliderTitle)
        addSubview(sliderValue)
        addSubview(slider)
        addSubview(minValueLabel)
        addSubview(maxValueLabel)
        
        sliderTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 36).isActive = true
        sliderTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        
        sliderValue.leftAnchor.constraint(equalTo: sliderTitle.rightAnchor, constant: 3).isActive = true
        sliderValue.centerYAnchor.constraint(equalTo: sliderTitle.centerYAnchor).isActive = true
        
        slider.topAnchor.constraint(equalTo: sliderTitle.bottomAnchor, constant: 10).isActive = true
        slider.leftAnchor.constraint(equalTo: sliderTitle.leftAnchor).isActive = true
        slider.rightAnchor.constraint(equalTo: rightAnchor, constant: -36).isActive = true
        
        minValueLabel.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 7).isActive = true
        minValueLabel.leftAnchor.constraint(equalTo: sliderTitle.leftAnchor).isActive = true
        minValueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        maxValueLabel.rightAnchor.constraint(equalTo: slider.rightAnchor).isActive = true
        maxValueLabel.centerYAnchor.constraint(equalTo: minValueLabel.centerYAnchor).isActive = true
        
    }
    
    func format(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(integerLiteral: number)) ?? "None"
    }
    
    
}
