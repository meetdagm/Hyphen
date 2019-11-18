//
//  AppDelegate.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/9/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit
import Parchment

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
        
        let movingServiceType = PickerViewController(usingIcon: UIImage(named: IconConfig.serviceType)!, withPickerData: ["Packing & Shipping", "Shipping Only", "Packing Only"])
        movingServiceType.placeholder = "Service Type"
        let serviceTypeStack = StackViewController(withChildrenVC: [movingServiceType])
        let serviceTypeCard = CardViewController(withChildController: serviceTypeStack)
        
        let roomsFilterController = SliderViewController(withTitle: "Number of rooms:", withMinValue: 1, withMaxValue: 10, withCurrentValue: 1, withSeparator: "up to ", incrementor: 1)
        
        let notesTextViewController = TextViewController()
        notesTextViewController.setText("Notes")
        notesTextViewController.setText(font: UIFont(name: FontConfig.demiBold, size: 16))
        notesTextViewController.setText(color: .black)
        let notesViewController = ExpandableTextViewController(withPlaceholder: "Add additional notes")
        let notesStack = StackViewController(withChildrenVC: [notesTextViewController, notesViewController])
        let notesCard = CardViewController(withChildController: notesStack)

        
        let movingViewController = BottomButtonViewController(usingButtonTitle: "REQUEST QUOTE", withTopViewController: VerticalScrollStackController(withChildControllers: [movingLocationCardView, movingDateCard, serviceTypeCard, roomsFilterController, notesCard]))

        
        movingViewController.view.backgroundColor = .clear
        movingViewController.title = "House items"
        
        
        let carStartingLocationTextFieldMoving = TextFieldViewController(withIcon: UIImage(named: IconConfig.location)!)
        carStartingLocationTextFieldMoving.placeholder = "Pickup location"
        let carDestinationTextFieldMoving = TextFieldViewController(withIcon: UIImage(named: IconConfig.location)!)
        carDestinationTextFieldMoving.placeholder = "Dropoff location"
        
        let carLocationMovingStackController = StackViewController(withChildrenVC: [carStartingLocationTextFieldMoving, carDestinationTextFieldMoving])
        let carMovingLocationCardView = CardViewController(withChildController: carLocationMovingStackController)
        
        let carDatePickerView = DatePickerViewController()
        carDatePickerView.placeholder = "Pickup Date"                
        let carDatePickerStack = StackViewController(withChildrenVC: [carDatePickerView])
        let carDatePickerCard = CardViewController(withChildController: carDatePickerStack)
        
        let carTypePickerView = PickerViewController(usingIcon: UIImage(named: IconConfig.car)!, withPickerData: ["Acura", "Alfa Romeo", "Aston Martin", "Audi", "Bentley", "BMW", "Bugatti", "Buick", "Cadillac", "Chevrolet", "Chrysler", "Citroen", "Dodge", "Ferrari", "Fiat", "Ford", "Geely", "General Motors", "GMC", "Honda", "Hyundai", "Infiniti", "Jaguar", "Jeep", "Kia", "Koenigsegg", "Lamborghini", "Land Rover", "Lexus", "Maserati", "Mazda", "McLaren", "Mercedes-Benz", "Mini", "Mitsubishi", "Nissan", "Pagani", "Peugeot", "Porsche", "Ram", "Renault", "Rolls Royce", "Saab", "Subaru", "Suzuki", "Tata Motors", "Tesla", "Toyota", "Volkswagen", "Volvo"])
        carTypePickerView.placeholder = "Car Type"
        let carTypeStack = StackViewController(withChildrenVC: [carTypePickerView])
        let carTypeCardView = CardViewController(withChildController: carTypeStack)
        
        let carMakePickerView = PickerViewController(usingIcon: UIImage(named: IconConfig.brand)!, withPickerData: ["All Models"])
        carMakePickerView.placeholder = "All Models"
        let carMakeStack = StackViewController(withChildrenVC: [carMakePickerView])
        let carMakeCard = CardViewController(withChildController: carMakeStack)

            
        let upgradeTextView = ExpandableTextViewController(withPlaceholder: "List upgrades to the vehicle if any")
        let upgradeStack = StackViewController(withChildrenVC: [upgradeTextView])
        let upgradeCard = CardViewController(withChildController: upgradeStack)
        
        let trailerType = PickerViewController(usingIcon: UIImage(named: IconConfig.binary)!, withPickerData: ["Enclosed Trailer", "Open Trailer"])
        let trailerDisclaimer = TextViewController()
        trailerDisclaimer.setText("*Disclaimer: Using an Enclosed trailer vs. an open one will result in higher costs")
        trailerDisclaimer.setText(font: UIFont.preferredFont(forTextStyle: .footnote))
        trailerDisclaimer.setText(color: ColorConfig.GrayText)
        
        let trailerStack = StackViewController(withChildrenVC: [trailerType, trailerDisclaimer])
        let trailerCard = CardViewController(withChildController: trailerStack)
        
        let vinTextField = TextFieldViewController(withIcon: UIImage(named: IconConfig.VIN)!)
        vinTextField.placeholder = "Enter the VIN number"
        let vinStack = StackViewController(withChildrenVC: [vinTextField])
        let vinCard = CardViewController(withChildController: vinStack)
        
        let carViewController = BottomButtonViewController(usingButtonTitle: "REQUEST A QUOTE", withTopViewController: VerticalScrollStackController(withChildControllers: [carMovingLocationCardView, carDatePickerCard, carTypeCardView, carMakeCard, vinCard,trailerCard, upgradeCard]))
        carViewController.title = "Car"
        carViewController.view.backgroundColor = ColorConfig.lightGray
        
        let vc4 = movingViewController
        
        vc4.title = "Moving"
        vc4.view.backgroundColor = ColorConfig.lightGray
        
        let vc5 = carViewController
        vc5.title = "Car Shipping"
        vc5.view.backgroundColor = .red
        
        let containerVC = CustomPagingViewController(withChildController: FixedPagingViewController(viewControllers: [vc1,vc2,vc3,vc4,vc5]))
        containerVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: IconConfig.feed), tag: 0)
        
        let biddingPreviewController = CollectionViewController(withCollectionModel: DefaultCollectionModel(), usingCellRenderer: DefaultCellRenderer<BiddingPreviewCell>(), usingCollectionView: CollectionViewFactory.getNormalCollectionView(inDirection: .vertical))
        biddingPreviewController.cellDimensionCalculator = CellSizeFactory.vBiddingPreviewCellSize
        biddingPreviewController.spacingBetweenItems = 12
        biddingPreviewController.insetForCollectionView = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        let biddingStackController = VerticalScrollStackController(withChildControllers: [biddingPreviewController])
        biddingStackController.inset = .zero
        biddingStackController.title = "Quotes"
        let bidNavigationController = NavigationControllerFactory.makeController(withRootController: biddingStackController)
        
        let bidViewController = bidNavigationController
//        bidViewController.view.backgroundColor = .red
        bidViewController.tabBarItem = UITabBarItem(title: "Bids", image: UIImage(named: IconConfig.bid), tag: 1)
        
        let messagePreviewModel = ModelFactory.makeMessagePreviewList()
        
        
        let messagesCollectionController = CollectionViewController(withCollectionModel: messagePreviewModel, usingCellRenderer: ChatPreviewCellRenderer(withItemCollection: messagePreviewModel), usingCollectionView: CollectionViewFactory.getNormalCollectionView(inDirection: .vertical))
        messagesCollectionController.cellDimensionCalculator = CellSizeFactory.vMessagePreviewCell
        messagesCollectionController.spacingBetweenItems = 3
        messagesCollectionController.insetForCollectionView = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 20.0, right: 0.0)
        
        let messagesController = VerticalScrollStackController(withChildControllers: [messagesCollectionController])
        messagesController.inset = UIEdgeInsets(top: 0, left: 9, bottom: 10, right: 9)
        messagesController.view.backgroundColor = ColorConfig.lightGray
        messagesController.title = "Messages"
        
        
        let messageNavigationController = NavigationControllerFactory.makeController(withRootController: messagesController)
        
        messageNavigationController.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(named: IconConfig.message), tag: 2)
        
        let settingsModel = ModelFactory.makeSettingsList()
        
        let profileCollectionController = CollectionViewController(withCollectionModel: settingsModel, usingCellRenderer: TextCellRenderer(withCollection: ItemCollection(withCollection: settingsModel.items)), usingCollectionView: CollectionViewFactory.getNormalCollectionView(inDirection: .vertical))
        
        profileCollectionController.cellDimensionCalculator = CellSizeFactory.vSettingCell
        profileCollectionController.spacingBetweenItems = 0
        profileCollectionController.insetForCollectionView = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)

        let profileController = VerticalScrollStackController(withChildControllers: [profileCollectionController])
        profileController.title = "Account"
        profileController.inset = UIEdgeInsets(top: 0, left: 9, bottom: 20, right: 9)
        profileController.view.backgroundColor = ColorConfig.lightGray
        
        let profileNavigationController = NavigationControllerFactory.makeController(withRootController: profileController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: IconConfig.profile), tag: 3)
        
        let tabBarController = TabBarController(withChildControllers: [containerVC, bidViewController, messageNavigationController, profileNavigationController])
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController
        
        return true
    }

}

