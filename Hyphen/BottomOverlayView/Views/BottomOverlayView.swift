//
//  BottomOverlayView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/16/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class BottomOverlayView: UIView {
    
    var bottomView: UIView? {
        didSet {
         add(bottomView: bottomView!)   
        }
    }
    
    var overlayView: UIView? {
        didSet {
            add(overlayView: overlayView!)
        }
    }
    
    
    private func add(bottomView view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func add(overlayView view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 220/812).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
    
    
}

