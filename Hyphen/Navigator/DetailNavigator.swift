//
//  DetailNavigator.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/24/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


//Hotel Detail navigator
//Real Estate Detail navigator
//Image Detail Navigator
//Flight Detail Navigator //Their own models //Their own factories

//DetailControllerFactory


class DetailNavigator {

    private let detailFactory: DetailFactory
    
    init(usingDetailFactory factory: DetailFactory) {
        detailFactory = factory
    }
    
    func presentItem(atIndexPath indexPath: IndexPath, overViewController controller: UIViewController) {
        let detailController = detailFactory.makeDetailControllerForItem(atIndexPath: indexPath)
        detailController.modalTransitionStyle = .crossDissolve
        controller.present(detailController, animated: true, completion: nil)
    }
    
}
