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
        layer.cornerRadius = 12
        layer.shadowColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 0.5).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 10.0/2.0
        layer.masksToBounds = false
    }
}
