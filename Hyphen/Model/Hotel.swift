//
//  Hotel.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/24/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation


class Hotel: Image {
    
    var originalPrice: Int
    var discountedPrice: Int
    var name: String
    
    init(name: String, originalPrice: Int, discountedPrice: Int, backgroundImageName: String) {
        self.name = name
        self.originalPrice = originalPrice
        self.discountedPrice = discountedPrice
        super.init()
        self.backgroundImageName = backgroundImageName
    }
    
}
