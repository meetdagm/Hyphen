//
//  ControllerFactory.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/20/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class ControllerFactory {
    
    static func embedInCardView(_ controller: UIViewController) -> UIViewController {
        return CardViewController(withChildController: StackViewController(withChildrenVC: [controller]))
    }
    
    static func makeCarShippingController() -> UIViewController {
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
        let stackController = VerticalScrollStackController(withChildControllers: [carMovingLocationCardView, carDatePickerCard, carTypeCardView, carMakeCard, vinCard,trailerCard, upgradeCard])
        stackController.view.backgroundColor = ColorConfig.lightGray
        let carViewController = BottomButtonViewController(usingButtonTitle: "REQUEST A QUOTE", withTopViewController: stackController)
        carViewController.view.backgroundColor = .black
        
        return NavBarController(withViewController: carViewController, withTitle: "CAR SHIPPING")
    }
    
    
    static func makeShippingController() -> UIViewController {
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
        
        let stackController = VerticalScrollStackController(withChildControllers: [movingLocationCardView, movingDateCard, serviceTypeCard, roomsFilterController, notesCard])
        stackController.view.backgroundColor = ColorConfig.lightGray
        
        let movingViewController = BottomButtonViewController(usingButtonTitle: "REQUEST QUOTE", withTopViewController: stackController)
        movingViewController.view.backgroundColor = .black
        
        return NavBarController(withViewController: movingViewController, withTitle: "SHIPPING")
    }
    
    static func makeHotelFilterController() -> UIViewController {
        return FilterFactory.makeHotelFilter()
    }
    
    static func makeRealEstateFilterController() -> UIViewController {
        return FilterFactory.makeRealEstateFilter()
    }
    
    static func makeRealEstateController() -> UIViewController {
        
        let realEstateModelCollection = ModelFactory.makeRealEstateModelCollection()
        let  bottomVC = MapViewController()
        bottomVC.filterController = FilterFactory.makeRealEstateFilter()
        
        let overlayVC = CollectionViewController(withCollectionModel: realEstateModelCollection, usingCellRenderer: DefaultCellRenderer<BackgroundImageCell>())
        overlayVC.cellDimensionCalculator = CellSizeFactory.hPreviewDefault
        overlayVC.insetForCollectionView = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        overlayVC.detailNavigator = DetailNavigator(usingDetailFactory: RealEstateDetailFactory(withRealEstateCollection: realEstateModelCollection))
        
        let vc1 = BottomOverlayViewController(withBottomVC: bottomVC, withOverlayVC: overlayVC)
        
        return vc1
    }
    
    static private func makeFlightResultPreviewController(withCollectionModel collectionModel: ItemCollection<Itinerary>, usingViewModel viewModel: FlightPreviewViewModel, withNavTitle title: String = "Flights") -> UIViewController {
        
        let cellHandler = FlightCellRenderer(withPreviewViewModel: viewModel)
        let resultPreviewController = CollectionViewController(withCollectionModel: collectionModel, usingCellRenderer: cellHandler, usingCollectionView: CollectionViewFactory.getNormalCollectionView(inDirection: .vertical))
        resultPreviewController.cellDimensionCalculator = CellSizeFactory.vFlightPreviewCellSize
        resultPreviewController.cellPresenter = cellHandler
        resultPreviewController.spacingBetweenItems = 12
        
        return NavBarController(withViewController: resultPreviewController, withTitle: title)
    }
    
    static func makeFlightController() -> UIViewController {
        
        //Get the item that was selected back to the text
        
        let searchModel = FlightSearchModel()
        
        let airportCollectionModel = ItemCollection(withCollection: [DescribableText]())
        let departureTextField = ControllerFactory.makeLocationSearchController(usingSearchAPI: AirportSearch(withAirportCollection: airportCollectionModel), navPlaceholder: "Add a departure location", withCollectionModel: airportCollectionModel, textPlaceholder: "City, Airport Code...") { (describableText) in
            if let airport = describableText as? Airport {
                searchModel.originPlace = airport.PlaceId
            }
        }
        
        let arrivalTextField = ControllerFactory.makeLocationSearchController(usingSearchAPI: AirportSearch(withAirportCollection: airportCollectionModel), navPlaceholder: "Add a desintation location", withCollectionModel: airportCollectionModel, textPlaceholder: "City, Airport Code..") { (describableText) in
            if let airport = describableText as? Airport {
                searchModel.destinationPlace = airport.PlaceId
            }
        }
        
        let locationStackController = StackViewController(withChildrenVC: [departureTextField, arrivalTextField])
        let locationCardView = CardViewController(withChildController: locationStackController)
        let departureDatePicker = DatePickerViewController { (date) in
            searchModel.departureDate = date
        }
        departureDatePicker.placeholder = "Add a departure date"
        
        let returnDatePicker = DatePickerViewController { (date) in
            searchModel.returnDate = date
        }
        returnDatePicker.placeholder = "Add a return date"
        let dateStackController = StackViewController(withChildrenVC: [departureDatePicker, returnDatePicker])
        let dateCardView = CardViewController(withChildController: dateStackController)
        
        let adultAmount = TextFieldViewController(withIcon: UIImage(named: IconConfig.passenger)!)
        adultAmount.placeholder = "\(searchModel.adults), Passenger(s)"
        adultAmount.keyboardType = .decimalPad
        adultAmount.valueEntered = { enteredText in
            searchModel.adults = enteredText
        }
        
        let adultAmountStack = StackViewController(withChildrenVC: [adultAmount])
        let adultAmountCardView = CardViewController(withChildController: adultAmountStack)
        
        let passengerClassType = PickerViewController(withValueChangedHandler: { (selectedText) in
            searchModel.cabinClass = CabinClassOption(fromRawValue: selectedText)
        }, icon: UIImage(named: IconConfig.passenger)!, data: ["Economy", "Premium Economy", "Business", "First"])
        
        let passengerAmountStackController = StackViewController(withChildrenVC: [passengerClassType])
        let passengerAmountCardView = CardViewController(withChildController: passengerAmountStackController)
        
        let stackController = VerticalScrollStackController(withChildControllers: [locationCardView, dateCardView, adultAmountCardView, passengerAmountCardView])
        stackController.view.backgroundColor = ColorConfig.lightGray
        
        let searchFlightController = BottomButtonViewController(usingButtonTitle: "SEARCH FLIGHT", withTopViewController: stackController)
        
        searchFlightController.handler = {
            requestSessionKey(byPostingData: searchModel.getMutableData(), completionHandler: { (sessionKey) in
                print("Session Key: ",sessionKey ?? "No Session Key")
                if let key = sessionKey {
                    requestItinerary(usingSessionKey: key, completionHandler: { (responseData) in
//                        let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary 
                        guard let data = responseData else { fatalError() }
                        searchFlightController.startSpinner()
                        if let data = responseData, let flightList = try? JSONDecoder().decode(FlightList.self, from: data) {
                            let flightCollection = ItemCollection(withCollection: flightList.Itineraries)
                            DispatchQueue.main.async {
                            searchFlightController.present(makeFlightResultPreviewController(withCollectionModel: flightCollection, usingViewModel: FlightPreviewViewModel(withFlightItineraries: flightList.Itineraries, usingFlightLegs: flightList.Legs, withFlightCarriers: flightList.Carriers, withTravelPlaces: flightList.Places), withNavTitle: "\(searchModel.originPlace) - \(searchModel.destinationPlace)"), animated: true, completion: nil)
                            }
                        }
                    })
                }else {
                    searchFlightController.stopSpinner()
                }
            })
            
        }
        
        return NavBarController(withViewController: searchFlightController, withTitle: "FLIGHTS")
    }
    
    static func makeHotelController(usingHotelList list: HotelList) -> UIViewController {
        
        let hotelModelCollection = ItemCollection(withCollection: list.data)
        let hotelMapVC = MapViewController()
        hotelMapVC.add(list.data)
        let hotelCollectionVC = CollectionViewController(withCollectionModel: hotelModelCollection, usingCellRenderer: HotelCellRenderer(withCollection: hotelModelCollection))
        hotelCollectionVC.cellDimensionCalculator = CellSizeFactory.hPreviewDefault
        
//        hotelCollectionVC.detailNavigator = DetailNavigator(usingDetailFactory: HotelDetailFactory(withHotelCollection: hotelModelCollection))
        hotelCollectionVC.insetForCollectionView = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        let vc2 = BottomOverlayViewController(withBottomVC: hotelMapVC, withOverlayVC: hotelCollectionVC)
        vc2.title = "Hotels"
        hotelCollectionVC.cellSelector = HotelCellSelector(withCollection: hotelModelCollection, usingSelectionHandler: { (model) in
            HotelDetailSearch.search(usingSearchModel: model, completionHandler: { (detailModel) in
                DispatchQueue.main.async {
                    if let detailMdl = detailModel {
                        vc2.present(ControllerFactory.makeHotelDetailController(detailMdl), animated: true, completion: nil)
                    }
                }
            })
        })
        return vc2
    }
    
    
    static private func requestSessionKey(byPostingData postData: NSMutableData, completionHandler: @escaping (String?) -> Void) {
        
        let headers = [
            "x-rapidapi-host": "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
            "x-rapidapi-key": "41cbec43f7mshabaac46a044c3cap143c04jsn158d226f08b0",
            "content-type": "application/x-www-form-urlencoded"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/v1.0")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completionHandler(nil)
            } else {
                let httpResponse = response as? HTTPURLResponse
                if let headerDict = httpResponse?.allHeaderFields, let locationHeader = headerDict["Location"] as? String {
                    let sessionKey = locationHeader.substring(from: locationHeader.range(of: "v1.0/")!.upperBound)
                    completionHandler(sessionKey)
                }else {
                    completionHandler(nil)
                }
                
            }
        })
        dataTask.resume()
        
    }
    
    
    static private func requestItinerary(usingSessionKey key: String, completionHandler: @escaping (Data?) -> Void) {
        
        let headers = [
            "x-rapidapi-host": "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
            "x-rapidapi-key": "41cbec43f7mshabaac46a044c3cap143c04jsn158d226f08b0"
        ]
        
        let urlPoll = NSURL(string: "https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/uk2/v1.0/\(key)?pageIndex=0&pageSize=10")! as URL
        print("URL: ", urlPoll)
        let request = NSMutableURLRequest(url: urlPoll,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
                completionHandler(nil)
            } else {
                if let responseData = data {
                    print("received Data")
                    completionHandler(responseData)
                }else {
                    completionHandler(nil)
                }
                
            }
        })
        dataTask.resume()
    } 
    
    static func makeLocationSearchController(usingSearchAPI searchAPI: SearchableAPI, navPlaceholder: String, 
                                             withCollectionModel collectionModel: ItemCollection<DescribableText>,
                                             textPlaceholder: String, 
                                             completionHandler handler: @escaping(_ selectedValue: DescribableText) -> Void) -> SearchTextFieldController {
        
        let cellRenderer = TextCellRenderer(withCollection: collectionModel)
        let cellSelector = TextCellSelector(withCollection: collectionModel)
        
        let departureTextField = SearchTextFieldController(withDescribableCollection: collectionModel, resultCellRenderer: cellRenderer)
        departureTextField.resultCellSelector = cellSelector
        departureTextField.searchableAPI = searchAPI
        departureTextField.navPlaceholder = navPlaceholder
        departureTextField.placeholder = textPlaceholder
        departureTextField.searchIcon = UIImage(named: IconConfig.location)
        cellSelector.selectedText = { selectedText in
            departureTextField.setValue = selectedText.text
            handler(selectedText)
            departureTextField.dismissSearch()
        }
        return departureTextField
    }
    
    static func makeAuthController() -> UIViewController {
        
        let logoImageController = ImageController()
        logoImageController.image = UIImage(named: IconConfig.logoWithText)
        logoImageController.backgroundColor = .black
        let loginButtonController = BottomButtonViewController(usingButtonTitle: "Login", withTopViewController: logoImageController)
        let signButtonController = BottomButtonViewController(usingButtonTitle: "Sign up", withTopViewController: loginButtonController)
        signButtonController.backgroundColor = .white
        signButtonController.textColor = .black
        
        return signButtonController
    }
    
    static func makeHotelDetailController(_ detailModel: HotelDetailModel) -> UIViewController {
        
        let imageCellRenderer = DefaultCellRenderer<ImageCell>()
        imageCellRenderer.customizationHandler = { (imageCell, index) in
            imageCell.imageView.backgroundColor = ColorConfig.lightGray
            let imageURL = URL(string: detailModel.imageCollection.item(atIndexPath: index).backgroundImageName ?? "")!
            imageCell.imageView.kf.indicatorType = .activity
            imageCell.imageView.kf.setImage(with: imageURL) 
        }
        let imageCarouselController = CollectionViewController(withCollectionModel: detailModel.imageCollection, usingCellRenderer: imageCellRenderer)
        imageCarouselController.cellDimensionCalculator = CellSizeFactory.fullSize
        imageCarouselController.isPagingEnabled = true
        imageCarouselController.spacingBetweenItems = 0
        imageCarouselController.spacingBetweenGroups = 0
        
        let hotelNameController = TextViewController()
        hotelNameController.setText(color: .black)
        hotelNameController.setText(detailModel.name)
        hotelNameController.setText(font: UIFont(name: FontConfig.demiBold, size: 16))
        
        let hotelRatingController = RatingController()
        hotelRatingController.rating = detailModel.rating
        hotelRatingController.text = detailModel.reviewAmount
        
        let amentiesCellRenderer = DefaultCellRenderer<DynamicTextCell>()
        amentiesCellRenderer.customizationHandler = { (cell, index) in
            cell.textLabel.text = detailModel.features.item(atIndexPath: index).name
            cell.textLabel.font = UIFont(name: FontConfig.medium, size: 12)
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = ColorConfig.GrayText.cgColor
            cell.layer.cornerRadius = 4.0
        }
        
        let amentiesTitle = TextViewController()
        amentiesTitle.setText("Amenities")
        amentiesTitle.setText(font: UIFont(name: FontConfig.medium, size: 15))
        
        let amentiesList = CollectionViewController(withCollectionModel: detailModel.features, usingCellRenderer: amentiesCellRenderer, usingCollectionView: CollectionViewFactory.getDynamicCellCollectionView(inDirection: .vertical))
        amentiesList.cellDimensionCalculator = CellSizeFactory.smallCell
        amentiesList.spacingBetweenItems = 7.0
        amentiesList.spacingBetweenGroups = 7.0
        amentiesList.insetForCollectionView = UIEdgeInsets(top: 0, left: 0, bottom: 9, right: 0)
        
        let amentiesStack = StackViewController(withChildrenVC: [amentiesTitle, amentiesList])
        let amentiesCard = CardViewController(withChildController: amentiesStack)
        
        let nameStack = StackViewController(withChildrenVC: [hotelNameController, hotelRatingController])
        let nameCard = CardViewController(withChildController: nameStack)
        
        let hotelStreetNameController = TextViewController()
        hotelStreetNameController.setText(color: .black)
        hotelStreetNameController.setText(detailModel.streetName)
        hotelStreetNameController.setText(font: UIFont(name: FontConfig.demiBold, size: 16))
        
        let hotelCityNameController = TextViewController()
        hotelCityNameController.setText(color: ColorConfig.GrayText)
        hotelCityNameController.setText(detailModel.cityName)
        hotelCityNameController.setText(font: UIFont(name: FontConfig.medium, size: 12))
        
        let cityNameStack = StackViewController(withChildrenVC: [hotelStreetNameController, hotelCityNameController])
        let cityNameCard = CardViewController(withChildController: cityNameStack)
        
        let hotelDescriptionTitleController = TextViewController()
        hotelDescriptionTitleController.setText(color: .black)
        hotelDescriptionTitleController.setText("Description")
        hotelDescriptionTitleController.setText(font: UIFont(name: FontConfig.medium, size: 15))
        
        let hotelDescriptionTextController = TextViewController()
        hotelDescriptionTextController.setText(color: .black)
        hotelDescriptionTextController.setText(detailModel.description)
        hotelDescriptionTextController.setText(font: UIFont(name: FontConfig.regular, size: 14))
        
        let descriptionStack = StackViewController(withChildrenVC: [hotelDescriptionTitleController, hotelDescriptionTextController])
        let descriptionCard = CardViewController(withChildController: descriptionStack)
        
        let infoVerticalStackController = VerticalScrollStackController(withChildControllers: [nameCard, cityNameCard, amentiesCard, descriptionCard])
        infoVerticalStackController.view.backgroundColor = ColorConfig.lightGray
        
        let bookingButtonController = BottomButtonViewController(usingButtonTitle: "CONTINUE | \(detailModel.price)", withTopViewController: EqualSplitViewController(withTopViewController: imageCarouselController, withBottomViewController: infoVerticalStackController))
        bookingButtonController.handler = {
            UIApplication.shared.open(detailModel.bookingURL, options: [:], completionHandler: nil)
        }
        
        let navController = NavBarController(withViewController: bookingButtonController, withTitle: "")
        navController.overlay = true
        navController.clearBackground()
        return navController
          
    }
    

    
}

