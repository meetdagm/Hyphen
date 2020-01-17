//
//  Itinerary.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/25/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation

struct Itinerary: Decodable {
    var OutboundLegId: String
    var PricingOptions: [PricingOption]
}

struct FlightList: Decodable {
    var Itineraries: [Itinerary]
    var Legs: [FlightLeg]
    var Carriers: [Carrier]
    var Places: [Place]
}
