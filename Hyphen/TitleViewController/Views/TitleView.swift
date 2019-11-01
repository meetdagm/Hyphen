//
//  TitleListView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/28/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class TitleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.font = UIFont(name: FontConfig.medium, size: 15)
        label.textColor = .black
        
        return label
    }()
    
    private func setupView() {
        embedView(titleLabel)
    }
    
}
