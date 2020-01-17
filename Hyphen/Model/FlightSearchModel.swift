//
//  FlightSearchModel.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/26/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation

class FlightSearchModel {
    
    var departureDate = Date()
    var returnDate: Date?
    var infants = "0"
    var adults = "1"
    var cabinClass: CabinClassOption = .economy
    var originPlace = "SFO-sky"
    var destinationPlace = "LHR-sky"
    
    
    func getMutableData() -> NSMutableData {
        let postData = NSMutableData(data: "outboundDate=\(formatDate(departureDate))".data(using: String.Encoding.utf8)!)
        postData.append("&cabinClass=\(cabinClass)".data(using: String.Encoding.utf8)!)
        postData.append("&children=0".data(using: String.Encoding.utf8)!)
        postData.append("&infants=\(infants)".data(using: String.Encoding.utf8)!)
        postData.append("&country=US".data(using: String.Encoding.utf8)!)
        postData.append("&currency=USD".data(using: String.Encoding.utf8)!)
        postData.append("&locale=en-US".data(using: String.Encoding.utf8)!)
        postData.append("&originPlace=\(originPlace)".data(using: String.Encoding.utf8)!)
        postData.append("&destinationPlace=\(destinationPlace)".data(using: String.Encoding.utf8)!)
        postData.append("&adults=\(adults)".data(using: String.Encoding.utf8)!)
        
        if let inboundDate = returnDate {
            postData.append("&inboundDate=\(formatDate(inboundDate))".data(using: String.Encoding.utf8)!)
        }
        
        return postData
    }
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date) 
    }
    
}

enum CabinClassOption: String {
    
    init(fromRawValue: String) {
        self = CabinClassOption(rawValue: fromRawValue) ?? .economy
    }
    
    case business = "Business", economy = "Economy", first = "First", premiumEconomy = "Premium Economy"
    
    var description: String {
        switch self {
        case .business: return "Business"
        case .economy: return "Economy"
        case .first: return "First"
        case .premiumEconomy: return "Premium Economy"
        }
    }
    
}
