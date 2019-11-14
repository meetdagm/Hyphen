//
//  CardView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/18/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class CardView: UIView, Shadowable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var backgroundColor: UIColor? {
        get { return maskingView.backgroundColor }
        set { maskingView.backgroundColor = newValue }
    }
    
    var cornerRadius: CGFloat? {
        get { return maskingView.layer.cornerRadius }
        set { maskingView.layer.cornerRadius = newValue! }
    }
    
    private let maskingView: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 2.0
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    func setupView() {
        addShadow()
        embedView(maskingView)
    } 

    func setBackgroundColor(_ color: UIColor) {
        maskingView.backgroundColor = color
    }
}

class CardViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cardView = CardView()
    
    func setupView() {
        embedView(cardView, usingEdgeInset: UIEdgeInsets(top: 0, left: 6.0, bottom: 0, right: 6.0))
    }
    
    func addToCard(_ view: UIView) {
        cardView.addSubview(view)
    }
    
}

