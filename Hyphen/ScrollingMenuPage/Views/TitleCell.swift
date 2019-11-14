//
//  TitleCell.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/15/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class TitleCell: UICollectionViewCell {
        
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .black : .lightGray
            titleLabel.font = isSelected ? .systemFont(ofSize: 16, weight: .medium) : .systemFont(ofSize: 16, weight: .regular)
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            titleLabel.textColor = isHighlighted ? .black : .lightGray
            titleLabel.font = isHighlighted ? .systemFont(ofSize: 16, weight: .medium) : .systemFont(ofSize: 16, weight: .regular)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView() 
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: .zero)
    }
    
    let titleLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    private func setupView() {
        
        addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
    
}


