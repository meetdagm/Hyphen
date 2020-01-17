//
//  RealEstateSearchModel.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/26/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation

class HotelSearchModel {
    
    var adults = 1
    var rooms = 1
    var locationID = ""
    var cityName = ""
    var hasOutdoorPool = false
    var hasFreeInternet = false
    var isByBeach       = false
    var hasFitnessCenter = false
    var hasSpa           = false
    var petsAllowed      = false
    var freeBreakfast    = false
    var freeParking     = false
    var hasRestaurant   = false
    
    func getURL() -> NSURL {
        return NSURL(string: "https://tripadvisor1.p.rapidapi.com/hotels/list?&adults=\(adults)&location_id=\(locationID)&rooms=\(rooms)")!
    }
    
}

struct HotelDetailData: Codable {
    var name: String
    var description: String
    var address_obj: Address
    var photo: PhotoData
    var price: String
    var num_reviews: String
    var rating: String
    var amenities: [Amenity]
    var web_url: String
}

struct Amenity: Codable {
    var name: String
}

struct HotelDetailModel: Codable {
    
    var data: [HotelDetailData]
    
    var name: String {
        return data.first?.name ?? "No name"
    }
    
    var description: String {
        return data.first?.description ?? "No description"
    }
    
    var streetName: String {
        return "\(data.first?.address_obj.street1 ?? ""), \(data.first?.address_obj.street2 ?? "")" 
    }
    
    var cityName: String {
        return "\(data.first?.address_obj.city ?? ""), \(data.first?.address_obj.country ?? "")"
    }
    
    var price: String {
        return "\(data.first?.price ?? "")"
    }
    
    var rating: Double {
        if let numString = data.first?.rating, let doubleNum = Double(numString)  {
            return doubleNum
        }
        return 0.0
    }
    
    var reviewAmount: String {
        return "(\(data.first?.num_reviews ?? "0") Review)"
    }
    
    var features: ItemCollection<Amenity> {
        if let amenities = data.first?.amenities {
            return ItemCollection(withCollection: amenities)
        }
        return ItemCollection(withCollection: [Amenity]())
    }
    
    var imageCollection: ItemCollection<Image> {
        let image = Image()
        image.backgroundImageName = data.first?.photo.images.large.url
        return ItemCollection(withCollection: [image])
    }
    
    
    var bookingURL: URL {
        if let url = data.first?.web_url, let directingURL = URL(string: url) {
            return directingURL
        }
        return URL(string: "www.tripadvisor.com")!
    }
    
}

struct Address: Codable {
    var street1: String
    var street2: String?
    var city: String
    var country: String
}
