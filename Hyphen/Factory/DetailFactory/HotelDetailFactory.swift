//
//  HotelDetailFactory.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/24/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class HotelDetailFactory: DetailFactory {
    
    private var hotelCollection: ItemCollection<Hotel>

    
    init(withHotelCollection collection: ItemCollection<Hotel>) {
        hotelCollection = collection
    }
    
    func makeDetailControllerForItem(atIndexPath indexPath: IndexPath) -> UIViewController {
        
        let descriptionTitleController = TextViewController()
        descriptionTitleController.setText("The Michelangelo")
        descriptionTitleController.setText(font: UIFont(name: FontConfig.demiBold, size: 16))
        descriptionTitleController.setText(color: .black)
        
        let descriptionDetailController = TextViewController()
        descriptionDetailController.setText("91% | Times square")
        descriptionDetailController.setText(color: ColorConfig.GrayText)
        descriptionDetailController.setText(font: UIFont(name: FontConfig.medium, size: 12))
//        
        let descriptionController = StackViewController(withChildrenVC:[descriptionTitleController, descriptionDetailController])
        let cardViewController = CardViewController(withChildController: descriptionController)

        let amentiesCollectionView = CollectionViewController(withCollectionModel: hotelCollection, usingCellRenderer: TitleIconCellRenderer(), usingCollectionView: CollectionViewFactory.getNormalCollectionView(inDirection: .vertical))
        amentiesCollectionView.cellDimensionCalculator = CellSizeFactory.vDynamicCell
        amentiesCollectionView.spacingBetweenItems = 0
        
        let amnetiesTitleView = TextViewController()
        amnetiesTitleView.setText("Amneties")
        amnetiesTitleView.setText(font: UIFont(name: FontConfig.medium, size: 15))
        
        let amentiesCardView = CardViewController(withChildController: StackViewController(withChildrenVC: [amnetiesTitleView, amentiesCollectionView]))
        
        let locationTitleView = TextViewController()
        locationTitleView.setText("152 W 51st Street")
        locationTitleView.setText(font: UIFont(name: FontConfig.demiBold, size: 16))
        locationTitleView.setText(color: .black)
        
        let locationDetailView = TextViewController()
        locationDetailView.setText("New York, NY")
        locationDetailView.setText(font: UIFont(name: FontConfig.medium, size: 12))
        locationDetailView.setText(color: ColorConfig.GrayText)
        
        let locationCardView = CardViewController(withChildController: StackViewController(withChildrenVC: [locationTitleView, locationDetailView]))
        
        let bottomViewController = VerticalScrollStackController(withChildControllers: [cardViewController, locationCardView, amentiesCardView])
        bottomViewController.view.backgroundColor = .white
        
        let topController = CollectionViewController(withCollectionModel: hotelCollection, usingCellRenderer: ImageCellRenderer(withImageCollection: ItemCollection(withCollection: hotelCollection.items)))
        topController.spacingBetweenItems = 1
        topController.isPagingEnabled = true
        topController.insetForCollectionView = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        topController.cellDimensionCalculator = CellSizeFactory.fullSize
        let controller = BottomButtonViewController(usingButtonTitle: "CONTINUE|$225", withTopViewController: EqualSplitViewController(withTopViewController: topController, 
                                                                                                    withBottomViewController: bottomViewController))
        controller.view.backgroundColor = ColorConfig.lightGray
        
        return controller 
    }
    
}
