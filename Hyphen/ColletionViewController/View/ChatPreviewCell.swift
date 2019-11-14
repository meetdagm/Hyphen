//
//  ChatPreviewCell.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/12/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class ChatPreviewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    

    let titleAcronymLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "VL"
        label.font = UIFont(name: FontConfig.demiBold, size: 18)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 21
        label.backgroundColor = .black
        label.layer.masksToBounds = true
        
        return label
    }()
    
    let titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: FontConfig.demiBold, size: 16)
        titleLabel.text = "VMLogistics"
        
        return titleLabel
    }()
    
    let descriptionLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontConfig.regular, size: 14)
        label.textColor = .black
        label.text = "This is a preview message for the client..."
        
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "2m"
        label.font = UIFont(name: FontConfig.regular, size: 13)
        label.textAlignment = .right
        
        return label
    }()
    
    let notificationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3"
        label.font = UIFont(name: FontConfig.regular, size: 13)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 2
        label.backgroundColor = ColorConfig.blue
        label.layer.masksToBounds = true
        
        return label
    }()
    
    let notificationIndicator: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorConfig.blue
        view.layer.cornerRadius = 4
        
        return view
    }()
    
    private let dividerLine: UIView = {
        
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = ColorConfig.GrayText
        
        return line
    }()
    
    
    
     func setupView() {
        
        addSubview(titleAcronymLabel)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(timeLabel)
        addSubview(notificationIndicator)
        addSubview(dividerLine)
        
        
        timeLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        timeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -9.0).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 27).isActive = true
        
        titleAcronymLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 9.0).isActive = true
        titleAcronymLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        titleAcronymLabel.widthAnchor.constraint(equalToConstant: 42).isActive = true
        titleAcronymLabel.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: titleAcronymLabel.rightAnchor, constant: 9.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: titleAcronymLabel.topAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3.0).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: titleAcronymLabel.bottomAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: timeLabel.rightAnchor).isActive = true
        
        notificationIndicator.widthAnchor.constraint(equalToConstant: 8).isActive = true
        notificationIndicator.heightAnchor.constraint(equalToConstant: 8).isActive = true
        notificationIndicator.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        notificationIndicator.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 6).isActive = true
        notificationIndicator.rightAnchor.constraint(lessThanOrEqualTo: timeLabel.leftAnchor).isActive = true
        
        dividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerLine.leftAnchor.constraint(equalTo: titleAcronymLabel.leftAnchor).isActive = true
        dividerLine.rightAnchor.constraint(equalTo: timeLabel.rightAnchor).isActive = true
        dividerLine.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}
