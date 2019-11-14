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
        
        let priceTextView = TextViewController()
        priceTextView.setText(color: .black)
        priceTextView.setText("$8,600/month")
        priceTextView.setText(font: UIFont(name: FontConfig.demiBold, size: 18))
        
        let detailTextView = TextViewController()
        detailTextView.setText("6bd | 3ba | 2,386 sqft")
        detailTextView.setText(color: ColorConfig.GrayText)
        detailTextView.setText(font: UIFont(name: FontConfig.medium, size: 12))
        
        let infoStack = StackViewController(withChildrenVC: [priceTextView, detailTextView])
        infoStack.layoutMargins = UIEdgeInsets(top: 12.0, left: 18, bottom: 12.0, right: 18)
        let infoCardView = CardViewController(withChildController: infoStack)
        
        let amnetyTextView = TextViewController()
        amnetyTextView.setText(color: .black)
        amnetyTextView.setText("Amenities")
        amnetyTextView.setText(font: UIFont(name: FontConfig.demiBold, size: 15))
        
        let amenityCollectionView = CollectionViewController(withCollectionModel: realEstateCollection, usingCellRenderer: TitleIconCellRenderer(), usingCollectionView: CollectionViewFactory.getNormalCollectionView(inDirection: .vertical))
        amenityCollectionView.cellDimensionCalculator = CellSizeFactory.vDynamicCell
        amenityCollectionView.spacingBetweenItems = 0
        
        let amenityStack = StackViewController(withChildrenVC: [amnetyTextView, amenityCollectionView])
        amenityStack.layoutMargins = UIEdgeInsets(top: 12.0, left: 18, bottom: 12.0, right: 18)
        let amenityCardView = CardViewController(withChildController: amenityStack)
        
        let descriptionTitleView = TextViewController()
        descriptionTitleView.setText(color: .black)
        descriptionTitleView.setText("Description")
        descriptionTitleView.setText(font: UIFont(name: FontConfig.demiBold, size: 15))
        
        let descriptionText = TextViewController()
        descriptionText.setText(color: .black)
        descriptionText.setText("This townhouse is neat as a pin. It has been well maintained, vacant and waiting for a new resident to take over.")
        descriptionText.setText(font: UIFont(name: FontConfig.regular, size: 14))
        
        let descriptionStack = StackViewController(withChildrenVC: [descriptionTitleView, descriptionText])
        descriptionStack.layoutMargins = UIEdgeInsets(top: 12.0, left: 18, bottom: 12.0, right: 18)
        let descriptionCard = CardViewController(withChildController: descriptionStack)
        
        let bottomViewController = VerticalScrollStackController(withChildControllers: [infoCardView, amenityCardView, descriptionCard])
        bottomViewController.view.backgroundColor = ColorConfig.lightGray
        
        let topController = CollectionViewController(withCollectionModel: realEstateCollection, usingCellRenderer: ImageCellRenderer(withImageCollection: ItemCollection(withCollection: realEstateCollection.items)))
        topController.spacingBetweenItems = 1
        topController.isPagingEnabled = true
        topController.insetForCollectionView = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        topController.cellDimensionCalculator = CellSizeFactory.fullSize
        
        return BottomButtonViewController(usingButtonTitle: "SCHEDULE A TOUR",withTopViewController: EqualSplitViewController(withTopViewController: topController, 
                                                                                          withBottomViewController: bottomViewController))
    }
}
