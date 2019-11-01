//
//  AppDelegate.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/9/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let realEstateModelCollection = ModelFactory.makeRealEstateModelCollection()
        let  bottomVC = MapViewController()
        bottomVC.filterController = FilterFactory.makeRealEstateFilter()
        
        let overlayVC = CollectionViewController(withCollectionModel: realEstateModelCollection, usingCellRenderer: DefaultCellRenderer())
        overlayVC.cellDimensionCalculator = CellSizeFactory.hPreviewDefault
        overlayVC.detailNavigator = DetailNavigator(usingDetailFactory: RealEstateDetailFactory(withRealEstateCollection: realEstateModelCollection))
        
        let vc1 = BottomOverlayViewController(withBottomVC: bottomVC, withOverlayVC: overlayVC)
        vc1.title = "Real Estate"
        
        let hotelModelCollection = ModelFactory.makeHotelModelCollection()
        let hotelMapVC = MapViewController()
        hotelMapVC.filterController = FilterFactory.makeHotelFilter()
        let hotelCollectionVC = CollectionViewController(withCollectionModel: hotelModelCollection, usingCellRenderer: HotelCellRenderer())
        hotelCollectionVC.cellDimensionCalculator = CellSizeFactory.hPreviewDefault
        hotelCollectionVC.detailNavigator = DetailNavigator(usingDetailFactory: HotelDetailFactory(withHotelCollection: hotelModelCollection))
        
        let vc2 = BottomOverlayViewController(withBottomVC: hotelMapVC, withOverlayVC: hotelCollectionVC)
        vc2.title = "Hotels"
        
        //Configure Flight Controller
        let departureTextField = TextFieldViewController(withIcon: UIImage(named: IconConfig.location)!)
        departureTextField.placeholder = "Add a departure location"
        let arrivalTextField = TextFieldViewController(withIcon: UIImage(named: IconConfig.location)!)
        arrivalTextField.placeholder = "Add a destination location"
        let locationStackController = StackViewController(withChildrenVC: [departureTextField, arrivalTextField])
        let locationCardView = CardViewController(withChildController: locationStackController)
        
        let departureDatePicker = DatePickerViewController()
        departureDatePicker.placeholder = "Add a departure date"
        let returnDatePicker = DatePickerViewController()
        returnDatePicker.placeholder = "Add a return date"
        let dateStackController = StackViewController(withChildrenVC: [departureDatePicker, returnDatePicker])
        let dateCardView = CardViewController(withChildController: dateStackController)
        
        let passengerAmountPicker = PickerViewController(usingIcon: UIImage(named: IconConfig.passenger)!, withPickerData: ["1 passenger, economy", "2 passengers, economy", "1 passenger, business", "2 passengers, business"])
        let passengerAmountStackController = StackViewController(withChildrenVC: [passengerAmountPicker])
        let passengerAmountCardView = CardViewController(withChildController: passengerAmountStackController)
        
        let searchFlightController = BottomButtonViewController(usingButtonTitle: "SEARCH FLIGHT", withTopViewController: VerticalScrollStackController(withChildControllers: [locationCardView, dateCardView, passengerAmountCardView]))
        
        let flightRootController = searchFlightController
        

        let vc3 = flightRootController
        vc3.title = "Flights"
        vc3.view.backgroundColor = ColorConfig.lightGray
        
        //Moving Configuration
        let startingLocationTextFieldMoving = TextFieldViewController(withIcon: UIImage(named: IconConfig.location)!)
        startingLocationTextFieldMoving.placeholder = "Pickup location"
        let destinationTextFieldMoving = TextFieldViewController(withIcon: UIImage(named: IconConfig.location)!)
        destinationTextFieldMoving.placeholder = "Dropoff location"
        
        let locationMovingStackController = StackViewController(withChildrenVC: [startingLocationTextFieldMoving, destinationTextFieldMoving])
        let movingLocationCardView = CardViewController(withChildController: locationMovingStackController)
        
        let movingDatePickerView = DatePickerViewController()
        movingDatePickerView.placeholder = "Pickup date"
        let movingDateStack = StackViewController(withChildrenVC: [movingDatePickerView])
        let movingDateCard = CardViewController(withChildController: movingDateStack)
        
        let roomsFilterController = SliderViewController(withTitle: "Number of rooms:", withMinValue: 1, withMaxValue: 10, withCurrentValue: 1, withSeparator: "up to ", incrementor: 1)
        let priceFilterController = SliderViewController(withTitle: "Price:", withMinValue: 50, withMaxValue: 1000, withCurrentValue: 50, withSeparator: "up to $", incrementor: 10)
        
        let movingViewController = BottomButtonViewController(usingButtonTitle: "POST BID", withTopViewController: VerticalScrollStackController(withChildControllers: [movingLocationCardView, movingDateCard, roomsFilterController, priceFilterController]))
        
        movingViewController.view.backgroundColor = .clear
        movingViewController.title = "House items"
        
        let carViewController = UIViewController()
        carViewController.view.backgroundColor = .red
        carViewController.title = "Car"
        
        let segmentedController = SegmentedViewController(withSegments: [movingViewController, carViewController])
        let movingScrollingPageViewController = ScrollingPageViewController(withViewControllers: [movingViewController, carViewController])
        
        movingScrollingPageViewController.scrollingDelegate = segmentedController
        segmentedController.selectionDelegate = movingScrollingPageViewController
        
        let vc4 = TopBarContainerViewController(withTopVC:segmentedController, withBottomVC:movingScrollingPageViewController)
        
        vc4.title = "Moving"
        vc4.view.backgroundColor = ColorConfig.lightGray
        
        let containerVC = ScrollingMenuPageViewController(withTitleControllers: [vc1, vc2, vc3, vc4]).controller
        containerVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: IconConfig.feed), tag: 0)
        
        let bidViewController = UIViewController()
        bidViewController.view.backgroundColor = .red
        bidViewController.tabBarItem = UITabBarItem(title: "Bids", image: UIImage(named: IconConfig.bid), tag: 1)
        
        let messagesController = UIViewController()
        messagesController.view.backgroundColor = .purple
        messagesController.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(named: IconConfig.message), tag: 2)
        
        let profileController = UIViewController()
        profileController.view.backgroundColor = .yellow
        profileController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: IconConfig.profile), tag: 3)
        
        let tabBarController = TabBarController(withChildControllers: [containerVC, bidViewController, messagesController, profileController])
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController
        
        return true
    }

}

