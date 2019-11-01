//
//  RealEstateDetailFactory.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/24/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class RealEstateDetailFactory: DetailFactory {
    
    private var realEstateCollection: ItemCollection<RealEstate>
    
    init(withRealEstateCollection collection: ItemCollection<RealEstate>) {
        realEstateCollection = collection
    }
    
    func makeDetailControllerForItem(atIndexPath indexPath: IndexPath) -> UIViewController {
        let bottomViewController = UIViewController()
        bottomViewController.view.backgroundColor = .blue
        
        let topController = CollectionViewController(withCollectionModel: realEstateCollection, usingCellRenderer: ImageCellRenderer(withImageCollection: ItemCollection(withCollection: realEstateCollection.items)))
        topController.spacingBetweenItems = 1
        topController.isPagingEnabled = true
        topController.insetForCollectionView = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        topController.cellDimensionCalculator = CellSizeFactory.fullSize
        
        return BottomButtonViewController(usingButtonTitle: "SCHEDULE A TOUR",withTopViewController: EqualSplitViewController(withTopViewController: topController, 
                                                                                          withBottomViewController: bottomViewController))
    }
}
