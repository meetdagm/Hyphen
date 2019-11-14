//
//  BackgroundImageCell.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/16/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class BackgroundImageCell: UICollectionViewCell, Shadowable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backgroundImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: ContentConfig.defaultBackgroundImageCell)
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let containerView: UIView = {
       
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 2.0
        view.layer.masksToBounds = true
        
        return view
    }()
    
    let priceLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$1,300/mo"
        label.textColor = .white
        label.font = UIFont(name: FontConfig.bold, size: 18)
       
        return label
    }()
    
    let featureLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3bds | 1.5ba | 1,600sqft"
        label.textColor = .white
        label.font = UIFont(name: FontConfig.medium, size: 12)
        
        return label
    }()

    let locationLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1104 Greentree Ct, Lexington, KY"
        label.textColor = .white
        label.font = UIFont(name: FontConfig.demiBold, size: 12)
        
        return label 
    }()
    
    let tintView: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return view
    }()
    
    func setupView() {
        backgroundColor = .yellow
        addShadow()
        embedView(containerView)
        containerView.embedView(backgroundImageView)
        containerView.embedView(tintView)
        containerView.addSubview(priceLabel)
        containerView.addSubview(featureLabel)
        containerView.addSubview(locationLabel)
        
        priceLabel.bottomAnchor.constraint(equalTo: featureLabel.topAnchor, constant: -2.25).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 13.5).isActive = true
        
        featureLabel.bottomAnchor.constraint(equalTo: locationLabel.topAnchor, constant: -2.25).isActive = true
        featureLabel.leftAnchor.constraint(equalTo: priceLabel.leftAnchor).isActive = true
        
        locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9.0).isActive = true
        locationLabel.leftAnchor.constraint(equalTo: priceLabel.leftAnchor).isActive = true
        
    }
 
}

