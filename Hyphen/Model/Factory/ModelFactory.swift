//
//  RealEstate.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/25/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation


class ModelFactory {
    
    static func makeRealEstateModelCollection() -> ItemCollection<RealEstate> {
       return ItemCollection(withCollection: [
            RealEstate(location: "524 Angliana avenue, Lexington, KY", price: 165000, backgroundImageName: ContentConfig.defaultBackgroundImageCell, bedroomAmount: 3, bathroomAmount: 4, area: 1400),
            RealEstate(location: "524 Angliana avenue, Lexington, KY", price: 165000, backgroundImageName: ContentConfig.defaultBackgroundImageCell, bedroomAmount: 3, bathroomAmount: 4, area: 1400),
            RealEstate(location: "524 Angliana avenue, Lexington, KY", price: 165000, backgroundImageName: ContentConfig.defaultBackgroundImageCell, bedroomAmount: 3, bathroomAmount: 4, area: 1400),
            RealEstate(location: "524 Angliana avenue, Lexington, KY", price: 165000, backgroundImageName: ContentConfig.defaultBackgroundImageCell, bedroomAmount: 3, bathroomAmount: 4, area: 1400),
            RealEstate(location: "524 Angliana avenue, Lexington, KY", price: 165000, backgroundImageName: ContentConfig.defaultBackgroundImageCell, bedroomAmount: 3, bathroomAmount: 4, area: 1400)])
    }
    
    static func makeHotelModelCollection() -> ItemCollection<Hotel> {
        return ItemCollection(withCollection: [
            Hotel(name: "The Michealangelo", originalPrice: 200, discountedPrice: 195, backgroundImageName: ContentConfig.defaultBackgroundImageCell2),
            Hotel(name: "The Michealangelo", originalPrice: 200, discountedPrice: 195, backgroundImageName: ContentConfig.defaultBackgroundImageCell2),
            Hotel(name: "The Michealangelo", originalPrice: 200, discountedPrice: 195, backgroundImageName: ContentConfig.defaultBackgroundImageCell2),
            Hotel(name: "The Michealangelo", originalPrice: 200, discountedPrice: 195, backgroundImageName: ContentConfig.defaultBackgroundImageCell2)])
    }
}
