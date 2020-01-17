//
//  Shadowable.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/17/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

protocol Shadowable { }

extension Shadowable where Self: UIView {
    func addShadow() {
        layer.shadowColor = ColorConfig.shadowColor.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 6.0)
        layer.shadowRadius = 4.0
        layer.masksToBounds = false
    }
    
    func removeShadow() {
        layer.shadowOpacity = 0
    }
}
