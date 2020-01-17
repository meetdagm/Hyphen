//
//  StackedDescrptionLabel.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/21/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class DualStackLabel: UIView {
    
    var bottomLabelColor: UIColor = .black {
        didSet {
            bottomLabel.textColor = bottomLabelColor
        }
    }
    
    var topLabelColor: UIColor = ColorConfig.GrayText {
        didSet {
            topLabel.textColor = topLabelColor
        }
    }
    
    var topLabelFont: UIFont? = .preferredFont(forTextStyle: .footnote) {
        didSet {
            topLabel.font = topLabelFont
        }
    }
    
    var bottomLabelFont: UIFont? = .preferredFont(forTextStyle: .footnote) {
        didSet {
            bottomLabel.font = bottomLabelFont
        }
    }
    
    
    var topLabelText: String? {
        didSet {
            topLabel.text = topLabelText
        }
    }
    

    var bottomLabelText: String? {
        didSet {
            bottomLabel.text = bottomLabelText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var topLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = topLabelColor
        label.font = topLabelFont
        
        return label
    }()
    
    private lazy var bottomLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = bottomLabelColor
        label.font = bottomLabelFont
        
        return label
    }()
    
    private let vStackView: UIStackView = {
       
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private func setupView() {
        embedView(vStackView)
        vStackView.addArrangedSubview(topLabel)
        vStackView.addArrangedSubview(bottomLabel)
    }
    
}
