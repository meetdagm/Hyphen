//
//  RealEstate.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/24/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation

class RealEstate: Image {
    
    var location: String
    var price: Int
    var bedroomAmount: Int
    var bathroomAmount: Int
    var area: Int
    
    init(location: String, price: Int, backgroundImageName: String, bedroomAmount: Int, bathroomAmount: Int, area: Int) {
        self.location = location
        self.price = price
        self.bedroomAmount = bedroomAmount
        self.bathroomAmount = bathroomAmount
        self.area = area
        super.init()
        self.backgroundImageName = backgroundImageName
    }
    
}
