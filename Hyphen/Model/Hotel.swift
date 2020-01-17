//
//  Hotel.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/24/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation


class Hotel: Image {
    
    var originalPrice: Int
    var discountedPrice: Int
    var name: String
    
    init(name: String, originalPrice: Int, discountedPrice: Int, backgroundImageName: String) {
        self.name = name
        self.originalPrice = originalPrice
        self.discountedPrice = discountedPrice
        super.init()
        self.backgroundImageName = backgroundImageName
    }
    
}

protocol Imageable {
    var imageURL: URL { get }
}

class ImageInfo: Codable {
    var url: String
}

class ImageData: Codable {
    var medium: ImageInfo
    var large: ImageInfo
}

class PhotoData: Codable {
    var images: ImageData
}

class HotelModel: Codable, Imageable, Locationable {
   
    var name: String
    var location_id: String
    var latitude: String
    var longitude: String
    var price: String
    var photo: PhotoData
    
    var imageURL: URL {
        return URL(string: photo.images.medium.url)!
    }
    
    var long: Double {
        return Double(longitude) ?? 0.0
    }
    
    var lat: Double {
        return Double(latitude) ?? 0.0
    }
    
}

class HotelList: Codable {
    var data: [HotelModel]
}
