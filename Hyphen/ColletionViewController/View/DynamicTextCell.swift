//
//  DynamicTextCell.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 1/14/20.
//  Copyright © 2020 6irdview. All rights reserved.
//

import UIKit

class DynamicTextCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var textLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test cell"
        label.sizeToFit()
        
        return label
    }()
    
    private func setupView() {
        embedView(textLabel, usingEdgeInset: UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6))
    }
    
}
