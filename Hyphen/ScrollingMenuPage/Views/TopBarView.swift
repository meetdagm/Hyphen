//
//  TopBarView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/14/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class TopBarView: UIView {
    
    var topView: UIView? {
        didSet {
            backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
            add(topView: topView!)
        }
    }
    
    var bottomView: UIView? {
        didSet {
            add(bottomView: bottomView!)
        }
    }
    
    private func add(topView: UIView) {
        addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 6.0).isActive = true
        topView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func add(bottomView: UIView) {
        if let topView = topView {
            addSubview(bottomView)
            bottomView.translatesAutoresizingMaskIntoConstraints = false
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            bottomView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            bottomView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        }
    }
    
}
