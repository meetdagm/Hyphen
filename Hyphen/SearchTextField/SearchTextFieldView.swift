//
//  SearchTextFieldView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/3/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class SearchTextFieldView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    let searchButton: UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Placehodler", for: .normal)
        button.titleLabel?.font = UIFont(name: FontConfig.medium, size: 14)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.imageView?.contentMode = .scaleAspectFit
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        
        return button
    }()
    
    private func setupView() {
        backgroundColor = .white
        
        embedView(searchButton)
        searchButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
}
