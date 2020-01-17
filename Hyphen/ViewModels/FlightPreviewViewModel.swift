//
//  FlightPreviewViewModel.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/25/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation

struct FlightPreviewViewModel {
    
    private let flightList: [Itinerary]
    private let flightLegs: [FlightLeg]
    private let flightCarriers: [Carrier]
    private let travelPlaces: [Place]
    
    init(withFlightItineraries itinerary: [Itinerary], usingFlightLegs legs: [FlightLeg], withFlightCarriers carriers: [Carrier], withTravelPlaces places: [Place]) {
        flightList = itinerary
        flightLegs = legs
        flightCarriers = carriers
        travelPlaces = places
    }
    
    func getPrice(forItemAt index: Int) -> String {
        return flightList[index].PricingOptions.first!.Price.format(withStyle: .currency)
    }
    
    func getDuration(forItemAt index: Int) -> String {
        let leg = getLeg(forID: flightList[index].OutboundLegId)
        let hoursMinutes = minutesToHoursMinutes(minutes: leg.Duration)
        return "\(String(format:"%02d", hoursMinutes.hours))h \(String(format:"%02d", hoursMinutes.leftMinutes))m"
    }
    
    func getStopsAmt(forItemAt index: Int) -> String {
        let leg = getLeg(forID: flightList[index].OutboundLegId)
        let legStops = leg.Stops.count
        if legStops > 0 {
            return "\(legStops) stop(s)"
        }else {
            return "Direct"
        }
    }
    
    func getDestinationArrivalTime(forItemAt index: Int) -> String {
        let leg = getLeg(forID: flightList[index].OutboundLegId)
        return "\(leg.getDepartureTime()) - \(leg.getArrivalTime())"
    }
    
    func getCarrierImageUrl(forItemAt index: Int) -> String {
        let leg = getLeg(forID: flightList[index].OutboundLegId)
        if let carrierID = leg.Carriers.first {
            let carrier = getCarrier(withID: carrierID)
            return carrier.ImageUrl
        }
        return ""
    }
    
    func getTripRoute(forItemAt index: Int) -> String {
        let leg = getLeg(forID: flightList[index].OutboundLegId)
        let destinationCode = getPlace(withID: leg.DestinationStation).Code
        let originCode = getPlace(withID: leg.OriginStation).Code
        return "\(originCode) - \(destinationCode)"
    }
    
    func getBookingURL(forItemAt index: Int) -> URL? {
        if let bookingURLString = flightList[index].PricingOptions.first?.DeeplinkUrl {
            return URL(string: bookingURLString)
        }
        return nil
    }
    
    private func getLeg(forID id: String) -> FlightLeg {
        return flightLegs.first(where: { $0.Id == id })!
    }
    
    private func minutesToHoursMinutes (minutes : Int) -> (hours : Int , leftMinutes : Int) {
        return (minutes / 60, (minutes % 60))
    }
    
    private func getCarrier(withID id: Int) -> Carrier {
        return flightCarriers.first(where: { $0.Id == id})!
    }
    
    private func getPlace(withID id: Int) -> Place {
        return travelPlaces.first(where: { $0.Id == id })!
    }
    
}
