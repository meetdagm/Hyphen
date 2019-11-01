//
//  ToggableView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/18/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class ToggableView: CardView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleDescription: String? {
        didSet {
            toggleTitle.text = titleDescription
        }
    }
    
    private let toggleTitle: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Toggle Title"
        label.textColor = .black
        label.font = UIFont(name: FontConfig.regular, size: 14)
        return label
    }()
    
    let toggleSwitch: UISwitch = {
       
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.onTintColor = .black
        
        return toggle
    }()
    
    override func setupView() {
        super.setupView()
        backgroundColor = .white
        
        addSubview(toggleTitle)
        addSubview(toggleSwitch)
        
        toggleSwitch.rightAnchor.constraint(equalTo: rightAnchor, constant: -36).isActive = true
        toggleSwitch.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        toggleTitle.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        toggleTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        toggleTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 36).isActive = true
        
    }
    
}
