//
//  PricingOption.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/25/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation

struct PricingOption: Decodable {
    
    var Agents: [Int]
    var DeeplinkUrl: String
    var Price: Double

}
