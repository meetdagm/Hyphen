//
//  RealEstate.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/25/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation


class ModelFactory {
    
    static func makeRealEstateModelCollection() -> ItemCollection<RealEstate> {
       return ItemCollection(withCollection: [
            RealEstate(location: "524 Angliana avenue, Lexington, KY", price: 165000, backgroundImageName: ContentConfig.defaultBackgroundImageCell, bedroomAmount: 3, bathroomAmount: 4, area: 1400),
            RealEstate(location: "524 Angliana avenue, Lexington, KY", price: 165000, backgroundImageName: ContentConfig.defaultBackgroundImageCell, bedroomAmount: 3, bathroomAmount: 4, area: 1400),
            RealEstate(location: "524 Angliana avenue, Lexington, KY", price: 165000, backgroundImageName: ContentConfig.defaultBackgroundImageCell, bedroomAmount: 3, bathroomAmount: 4, area: 1400),
            RealEstate(location: "524 Angliana avenue, Lexington, KY", price: 165000, backgroundImageName: ContentConfig.defaultBackgroundImageCell, bedroomAmount: 3, bathroomAmount: 4, area: 1400),
            RealEstate(location: "524 Angliana avenue, Lexington, KY", price: 165000, backgroundImageName: ContentConfig.defaultBackgroundImageCell, bedroomAmount: 3, bathroomAmount: 4, area: 1400)])
    }
    
    static func makeHotelModelCollection() -> ItemCollection<Hotel> {
        return ItemCollection(withCollection: [
            Hotel(name: "The Michealangelo", originalPrice: 200, discountedPrice: 195, backgroundImageName: ContentConfig.defaultBackgroundImageCell2),
            Hotel(name: "The Michealangelo", originalPrice: 200, discountedPrice: 195, backgroundImageName: ContentConfig.defaultBackgroundImageCell2),
            Hotel(name: "The Michealangelo", originalPrice: 200, discountedPrice: 195, backgroundImageName: ContentConfig.defaultBackgroundImageCell2),
            Hotel(name: "The Michealangelo", originalPrice: 200, discountedPrice: 195, backgroundImageName: ContentConfig.defaultBackgroundImageCell2)])
    }
    
    
    static func makeSettingsList() -> ItemCollection<SettingItem> {
        return ItemCollection(withCollection: [
            SettingItem(name: "Ikenna Ike", detail: "Change your account information"),
            SettingItem(name: "Track Items", detail: "Track your belongings as they are being moved."),
            SettingItem(name: "Addresses", detail: "Add or remove a delivery address"),
            SettingItem(name: "Payment Cards", detail: "Add a debit or credit card"),
            SettingItem(name: "Manage HyphenPass", detail: ""),
            SettingItem(name: "Contact Support", detail: ""),
            SettingItem(name: "Unlink Facebook", detail: ""),
            SettingItem(name: "Credits & Gift Cards", detail: ""),
            SettingItem(name: "Manage HyphenPass", detail: ""),
            SettingItem(name: "Contact Support", detail: ""),
            SettingItem(name: "Unlink Facebook", detail: ""),
            SettingItem(name: "Credits & Gift Cards", detail: ""),
            SettingItem(name: "Manage HyphenPass", detail: ""),
            SettingItem(name: "Contact Support", detail: ""),
            SettingItem(name: "Unlink Facebook", detail: ""),
            SettingItem(name: "Credits & Gift Cards", detail: ""),
            SettingItem(name: "Manage HyphenPass", detail: ""),
            SettingItem(name: "Contact Support", detail: ""),
            SettingItem(name: "Unlink Facebook", detail: ""),
            SettingItem(name: "Credits & Gift Cards", detail: ""),
            SettingItem(name: "Manage HyphenPass", detail: ""),
            SettingItem(name: "Contact Support", detail: ""),
            SettingItem(name: "Unlink Facebook", detail: ""),
            SettingItem(name: "Credits & Gift Cards", detail: ""),
            ])
    }
    
    static func makeMessagePreviewList() -> ItemCollection<MessagePreview> {
        return ItemCollection(withCollection: [
            MessagePreview(name: "VMLogistics", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "Alex's Moving Services", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "Johny Garrage", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "Fast Logistics", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "OnTime", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "LG Delivery", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "Johny Garrage", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "Fast Logistics", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "OnTime", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "LG Delivery", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "Johny Garrage", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "Fast Logistics", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "OnTime", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "LG Delivery", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "Johny Garrage", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "Fast Logistics", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "OnTime", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            MessagePreview(name: "LG Delivery", chatPreview: "Hello Dennise, we moved your Rolls Royce to the back of the garage..."),
            ])
    }
}
