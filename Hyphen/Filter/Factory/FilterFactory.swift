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
        
        let searchModel = HotelSearchModel()
        let cityCollectionModel = ItemCollection(withCollection: [DescribableText]())
        let destinationCard = ControllerFactory.makeLocationSearchController(usingSearchAPI: CitySearch(withCollection: cityCollectionModel), navPlaceholder: "What city are you looking in?", withCollectionModel: cityCollectionModel, textPlaceholder: "City, County, Zip code...") { (describableText) in
            if let city = describableText as? CityData {
                searchModel.locationID = city.result_object.location_id
                searchModel.cityName = city.text
            }
        }
    
        let roomsController = SliderViewController(withTitle: "Bedrooms", withMinValue: 1, withMaxValue: 5)
        roomsController.valueChanged = { sliderValue in
            searchModel.rooms = Int(sliderValue)
        }
        
        let adultsController = SliderViewController(withTitle: "Adults", withMinValue: 1, withMaxValue: 5, withCurrentValue: Float(searchModel.adults))
        adultsController.valueChanged = { sliderValue in
            searchModel.adults = Int(sliderValue)
        }
        
        let stackController = VerticalScrollStackController(withChildControllers: [
            ControllerFactory.embedInCardView(destinationCard),
            roomsController,
            adultsController,
            SliderViewController(withTitle: "Price", withMinValue: 50, withMaxValue: 500, withSeparator: "up to $"),
            ToggableViewController(withTitle: "Breakfast"), 
            ToggableViewController(withTitle: "Wifi"),
            ToggableViewController(withTitle: "Pool"),
            ToggableViewController(withTitle: "Parking"),
            ToggableViewController(withTitle: "Pets"),
            ToggableViewController(withTitle: "Gym"),
            ToggableViewController(withTitle: "Dry cleaning")
            ])
        stackController.view.backgroundColor = ColorConfig.lightGray
        let searchButtonController = BottomButtonViewController(usingButtonTitle: "SEARCH HOTEL", withTopViewController: stackController)
        searchButtonController.view.backgroundColor = .black
        
        searchButtonController.handler = {
            searchButtonController.startSpinner()
            HotelSearch.search(usingSearchModel: searchModel, completionHandler: { (data) in
                DispatchQueue.main.async {
                    guard let responseData = data, let jsonData = try? JSONSerialization.jsonObject(with: responseData, options: []) as? NSDictionary
                    else { searchButtonController.stopSpinner(); PresentNotification("Please try again!", usingController: searchButtonController, nil); return }
            
                    guard let list = try? JSONDecoder().decode(HotelList.self, from: responseData) else { searchButtonController.stopSpinner(); PresentNotification("Can't communicate with server", usingController: searchButtonController, nil); return }
                    
                    let navController = NavBarController(withViewController: ControllerFactory.makeHotelController(usingHotelList: list), withTitle: searchModel.cityName)
                    navController.overlay = true
                    navController.modalTransitionStyle = .crossDissolve
                    searchButtonController.stopSpinner()
                    searchButtonController.present(navController, animated: true, completion: nil)
                }
            })
        }
        
        return NavBarController(withViewController: searchButtonController, withTitle: "Hotel Search", titleForRightBarButton: "")
    }
    
    
    static func makeRealEstateFilter() -> UIViewController {
        
        
        let cityCollectionModel = ItemCollection(withCollection: [DescribableText]())
        let locationSearchController = ControllerFactory.makeLocationSearchController(usingSearchAPI: CitySearch(withCollection: cityCollectionModel), navPlaceholder: "What city are you looking in?", withCollectionModel: cityCollectionModel, textPlaceholder: "City, County, Zip code...") { (describableText) in
            print("City name \(describableText.text)")
        }
        
        let stackController = VerticalScrollStackController(withChildControllers: [
            ControllerFactory.embedInCardView(locationSearchController),
            SliderViewController(withTitle: "Bedrooms", withMinValue: 1, withMaxValue: 10),
            SliderViewController(withTitle: "Bathrooms", withMinValue: 1, withMaxValue: 10),
            SliderViewController(withTitle: "Price", withMinValue: 100000, withMaxValue: 1000000, withSeparator: "up to $", incrementor: 50000),
            SliderViewController(withTitle: "Parking spot", withMinValue: 1, withMaxValue: 5),
            ToggableViewController(withTitle: "Has basement"), 
            ToggableViewController(withTitle: "Has swimming pool"),
            ToggableViewController(withTitle: "Gated community"),
            ])
        stackController.view.backgroundColor = ColorConfig.lightGray
        let searchButtonController = BottomButtonViewController(usingButtonTitle: "SEARCH REAL ESTATE", withTopViewController: stackController)
        searchButtonController.view.backgroundColor = UIColor(red: 72/255, green: 98/255, blue: 230/255, alpha: 1.0)
        
        let controller = NavBarController(withViewController: searchButtonController, withTitle: "Real Estate Search", titleForRightBarButton: "")
    
        return controller
    }
    
}
