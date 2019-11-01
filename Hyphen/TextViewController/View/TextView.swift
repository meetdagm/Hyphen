//
//  TextView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/31/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class TextView: UIView {
    
    var font: UIFont? {
        didSet {
            textLabel.font = font
        }
    }
    
    var text: String? {
        didSet{
            textLabel.text = text
        }
    }
    
    var textColor: UIColor = .black {
        didSet {
            textLabel.textColor = textColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = textColor
        
        return label
    }()
    
    private func setupView() {
        embedView(textLabel)
    }
    
}
