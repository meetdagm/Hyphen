//
//  ViewControllerSelectionCell.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/12/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class ViewControllerSelectionCell: UICollectionViewCell, Shadowable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let iconView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontConfig.demiBold, size: 16)
        label.textColor = .black
        label.text = "VC Title"
        
        return label
    }()
    
    private let maskingView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8.0
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        view.layer.borderColor = ColorConfig.shadowBorder.cgColor
        view.layer.borderWidth = 1.0
        return view
    }()
    
    
    private func setupView() {
        
        embedView(maskingView)
        addShadow()
        backgroundColor = .clear
        addSubview(titleLabel)
        addSubview(iconView)
        
        iconView.topAnchor.constraint(equalTo: topAnchor, constant: 18).isActive = true
        iconView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 18).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18).isActive = true
    }
    
}

