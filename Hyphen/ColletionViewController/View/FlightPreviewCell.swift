//
//  FlightPreviewCell.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/21/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class FlightPreviewCell: CardViewCell {
    
    let titleLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$46"
        label.font = UIFont(name: FontConfig.demiBold, size: 18)
        
        return label
    }()
    
    let iconView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: IconConfig.airlineIcon)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let leftStackedLabel: DualStackLabel = {
       
        let label = DualStackLabel()
        label.bottomLabelColor = .black
        label.topLabelColor = ColorConfig.GrayText
        label.bottomLabelText = "06:10a - 07:28a"
        label.topLabelText = "LAX - LAS"
        label.topLabelFont = UIFont(name: FontConfig.medium, size: 14)!
        label.bottomLabelFont = UIFont(name: FontConfig.medium, size: 14)!
        
        return label
    }()
    
    let centerStackedLabel: DualStackLabel = {
       
        let label = DualStackLabel()
        label.bottomLabelColor = .black
        label.topLabelColor = ColorConfig.GrayText
        label.bottomLabelText = "01h 21m"
        label.topLabelText = "Duration"
        label.topLabelFont = UIFont(name: FontConfig.medium, size: 14)!
        label.bottomLabelFont = UIFont(name: FontConfig.medium, size: 14)!
        
        return label
        
    }()
    
    let rightStackedLabel: DualStackLabel = {
        
        let label = DualStackLabel()
        label.bottomLabelColor = .black
        label.topLabelColor = ColorConfig.GrayText
        label.bottomLabelText = "Direct"
        label.topLabelText = "Stops"
        label.topLabelFont = UIFont(name: FontConfig.medium, size: 14)!
        label.bottomLabelFont = UIFont(name: FontConfig.medium, size: 14)!
        
        return label
    }()
    
    private let hBottomStack: UIStackView = {
       
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    override func setupView() {
        super.setupView()
        
        addSubview(hBottomStack)
        addSubview(titleLabel)
        addSubview(iconView)
        
        hBottomStack.addArrangedSubview(leftStackedLabel)
        hBottomStack.addArrangedSubview(centerStackedLabel)
        hBottomStack.addArrangedSubview(rightStackedLabel)
        
        iconView.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        iconView.rightAnchor.constraint(equalTo: hBottomStack.rightAnchor, constant: -18).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 9).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: hBottomStack.leftAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: hBottomStack.topAnchor).isActive = true
        titleLabel.rightAnchor.constraint(lessThanOrEqualTo: iconView.leftAnchor).isActive = true
        
        hBottomStack.topAnchor.constraint(equalTo: centerYAnchor).isActive = true
        hBottomStack.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 18).isActive = true
        hBottomStack.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -18).isActive = true
        hBottomStack.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -9).isActive = true

        

    }
}
