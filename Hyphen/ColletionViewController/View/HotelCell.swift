//
//  HotelCell.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/16/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class HotelCell: UICollectionViewCell, Shadowable {
    
    
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
        imageView.image = UIImage(named: ContentConfig.defaultBackgroundImageCell2)
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
    
    let tintView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return view
    }()
    
    let hotelName: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The Roger"
        label.font = UIFont(name: FontConfig.demiBold, size: 18)
        label.textColor = .white
        
        return label
    }()
    
    let hotelDescription: UILabel = {
           
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "91%|Times square"
        label.font = UIFont(name: FontConfig.medium, size: 11)
        label.textColor = ColorConfig.lightGray
       
        return label
    }()
    
    let originalPriceLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$228"
        label.font = UIFont(name: FontConfig.bold, size: 18)
        label.textColor = .white
        
        return label
    }()
    
    let discountedPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "was $338"
        label.font = UIFont(name: FontConfig.medium, size: 11)
        label.textColor = ColorConfig.lightGray
        
        return label
    }()
    
    private func setupView() {
        embedView(containerView)
        containerView.embedView(backgroundImageView)
        containerView.embedView(tintView)
        containerView.addSubview(originalPriceLabel)
        containerView.addSubview(discountedPriceLabel)
        containerView.addSubview(hotelName)
        containerView.addSubview(hotelDescription)
        
        hotelDescription.bottomAnchor.constraint(equalTo: discountedPriceLabel.bottomAnchor).isActive = true
        hotelDescription.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        
        hotelName.bottomAnchor.constraint(equalTo: hotelDescription.topAnchor).isActive = true
        hotelName.leftAnchor.constraint(equalTo: hotelDescription.leftAnchor).isActive = true
        
        discountedPriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -9.0).isActive = true
        discountedPriceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12.0).isActive = true
        
        originalPriceLabel.bottomAnchor.constraint(equalTo: discountedPriceLabel.topAnchor).isActive = true
        originalPriceLabel.rightAnchor.constraint(equalTo: discountedPriceLabel.rightAnchor).isActive = true
        
    }
    
    
}


