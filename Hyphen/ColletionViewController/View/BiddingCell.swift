//
//  BiddingCell.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/18/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class BiddingPreviewCell: CardViewCell {
    
    
    let previewTitle: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontConfig.demiBold, size: 18)
        label.text = "Preview Title"
        
        return label
    }()
    
    private let notificationLabel: UILabel = {
       
        let label = PaddingLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontConfig.demiBold, size: 12)
        label.text = "New Quote"
        label.backgroundColor = ColorConfig.blue
        label.textColor = .white
        label.layer.cornerRadius = 9
        label.layer.masksToBounds = true
        label.paddingInset = UIEdgeInsets(top: 3, left: 9, bottom: 3, right: 9)
        
        return label
    }()
    
    let leftDetailLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontConfig.regular, size: 14)
        label.text = "Posted: 2 weeks ago"
        
        return label
    }()
    
    let centerDetailLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontConfig.regular, size: 14)
        label.text = "Avg Price: $65"
        
        return label
    }()
    
    let rightDetailLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FontConfig.regular, size: 14)
        label.text = "Quote Amt: 5"
        
        return label
    }()
    
    let hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    override func setupView() {
        super.setupView()
        
        addSubview(previewTitle)
        addSubview(notificationLabel)
        addSubview(leftDetailLabel)
        addSubview(rightDetailLabel)
        addSubview(centerDetailLabel)
        addSubview(hStackView)
        
        
        previewTitle.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 12).isActive = true
        previewTitle.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 12).isActive = true
        
        notificationLabel.topAnchor.constraint(equalTo: previewTitle.topAnchor).isActive = true
        notificationLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -12).isActive = true
        notificationLabel.leftAnchor.constraint(greaterThanOrEqualTo: previewTitle.rightAnchor).isActive = true
        notificationLabel.bottomAnchor.constraint(equalTo: previewTitle.bottomAnchor).isActive = true
        
        hStackView.topAnchor.constraint(greaterThanOrEqualTo: previewTitle.bottomAnchor).isActive = true
        hStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -12).isActive = true
        hStackView.leftAnchor.constraint(equalTo: previewTitle.leftAnchor).isActive = true
        hStackView.rightAnchor.constraint(equalTo: notificationLabel.rightAnchor).isActive = true
        
        hStackView.addArrangedSubview(leftDetailLabel)
        hStackView.addArrangedSubview(centerDetailLabel)
        hStackView.addArrangedSubview(rightDetailLabel)
        
    }
    
}
