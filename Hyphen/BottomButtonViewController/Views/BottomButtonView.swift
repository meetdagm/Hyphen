//
//  BottomButtonView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class BottomButtonView: UIView {
    
    var topView: UIView? {
        didSet {
            if let view = topView {
                addTopView(view)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let bottomButton: UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Title", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    private func addTopView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomButton.topAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func setupView() {
        backgroundColor = bottomButton.backgroundColor
        addSubview(bottomButton)
        
        bottomButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bottomButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
