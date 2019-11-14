//
//  VerticalScrollStackView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/18/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class VerticalScrollStackView: UIView {
    
    var margins: UIEdgeInsets = .zero {
        didSet {
            vStackView.layoutMargins = margins
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let vScrollView: UIScrollView = {
       
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        
        return scrollView
    }()
    
    let vStackView: UIStackView = {
       
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16.0
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 18.0, left: 9.0, bottom: 0, right: 9.0)
        
        return stackView
    }()
    
    private func setupView() {
        backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
        addSubview(vScrollView)
        vScrollView.addSubview(vStackView)
        
        vScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        vScrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        vScrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        vScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        vStackView.topAnchor.constraint(equalTo: vScrollView.topAnchor).isActive = true
        vStackView.leftAnchor.constraint(equalTo: vScrollView.leftAnchor).isActive = true
        vStackView.rightAnchor.constraint(equalTo: vScrollView.rightAnchor).isActive = true
        vStackView.bottomAnchor.constraint(equalTo: vScrollView.bottomAnchor).isActive = true
        vStackView.widthAnchor.constraint(equalTo: vScrollView.widthAnchor).isActive = true
    
    }
    
    func addChild(_ view: UIView) {
        vStackView.addArrangedSubview(view)
    }
    
}
