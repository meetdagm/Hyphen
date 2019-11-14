//
//  TextCell.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/2/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class TextCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let textLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = UIFont(name: FontConfig.demiBold, size: 16)
        label.textColor = .black
        
        return label 
    }()
    
    let descriptionLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "description text goes here"
        label.font = UIFont(name: FontConfig.regular, size: 12)
        label.textColor = ColorConfig.GrayText
        
        return label
    }()
    
    private let dividerLine: UIView = {
       
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = ColorConfig.GrayText
        
        return line
    }()
    
    private let accessoryIcon: UIImageView = {
       
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: IconConfig.moreArrow)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    
    
    private func setupView() {
        
        addSubview(textLabel)
        addSubview(descriptionLabel)
        addSubview(dividerLine)
        addSubview(accessoryIcon)
        
        textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 9.0).isActive = true
        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 9.0).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: textLabel.leftAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: dividerLine.topAnchor, constant: -6.0).isActive = true
        
        dividerLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        dividerLine.leftAnchor.constraint(equalTo: textLabel.leftAnchor).isActive = true
        dividerLine.rightAnchor.constraint(equalTo: accessoryIcon.rightAnchor).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        accessoryIcon.rightAnchor.constraint(equalTo: rightAnchor, constant: -9).isActive = true
        accessoryIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        accessoryIcon.widthAnchor.constraint(equalToConstant: 10).isActive = true
        accessoryIcon.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
    }
    
}
