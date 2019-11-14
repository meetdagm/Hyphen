//
//  TitleIconCell.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/28/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class TitleIconCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let iconImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontConfig.regular, size: 13)
        label.textColor = .black
        
        return label
    }()
    
    private func setupView() {
        
        addSubview(iconImageView)
        addSubview(titleLabel)
        
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 9.0).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}
