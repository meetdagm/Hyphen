//
//  FilterFactory.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/20/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


struct FilterFactory {
    
   static func makeHotelFilter() -> UIViewController {
        let destinationCard = TextFieldViewController(withIcon: UIImage(named: IconConfig.location)!)
        destinationCard.placeholder = "Add a destination"
       return NavBarController(withViewController: 
        VerticalScrollStackController(withChildControllers: [
            CardViewController(withChildController: StackViewController(withChildrenVC: [destinationCard])),
            SliderViewController(withTitle: "Bedrooms", withMinValue: 1, withMaxValue: 5),
            SliderViewController(withTitle: "Price", withMinValue: 50, withMaxValue: 500, withSeparator: "up to $"),
            ToggableViewController(withTitle: "Breakfast"), 
            ToggableViewController(withTitle: "Wifi"),
            ToggableViewController(withTitle: "Pool"),
            ToggableViewController(withTitle: "Parking"),
            ToggableViewController(withTitle: "Pets"),
            ToggableViewController(withTitle: "Gym"),
            ToggableViewController(withTitle: "Dry cleaning")
            ]), withTitle: "Filters", titleForRightBarButton: "Reset")
    }
    
    static func makeRealEstateFilter() -> UIViewController {
        return NavBarController(withViewController: 
            VerticalScrollStackController(withChildControllers: [
                SliderViewController(withTitle: "Bedrooms", withMinValue: 1, withMaxValue: 10),
                SliderViewController(withTitle: "Bathrooms", withMinValue: 1, withMaxValue: 10),
                SliderViewController(withTitle: "Price", withMinValue: 100000, withMaxValue: 1000000, withSeparator: "up to $", incrementor: 50000),
                SliderViewController(withTitle: "Parking spot", withMinValue: 1, withMaxValue: 5),
                ToggableViewController(withTitle: "Has basement"), 
                ToggableViewController(withTitle: "Has swimming pool"),
                ToggableViewController(withTitle: "Gated community"),
                ]), withTitle: "Filters", titleForRightBarButton: "Reset")
    }
    
}
