//
//  FlightLeg.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/25/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation

struct FlightLeg: Codable {
    
    var Id: String
    private var Departure: String
    private var Arrival: String
    var Duration: Int
    var Stops: [Int]
    var Carriers: [Int]
    var DestinationStation: Int
    var OriginStation: Int
    
    
    func getDepartureTime() -> String {
        return extractHourTime(fromDate: Departure)
    } 
    
    func getArrivalTime() -> String {
        return extractHourTime(fromDate: Arrival)
    }
    
    private func extractHourTime(fromDate date: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let time = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "hh:mma"
            dateFormatter.pmSymbol = "p"
            dateFormatter.amSymbol = "a"
            return dateFormatter.string(from: time)
        }
        return "TBD"
    } 
    
}
