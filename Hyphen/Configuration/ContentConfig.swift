//
//  ContentConfig.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/17/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

enum ContentConfig {
    static let defaultBackgroundImageCell   = "realEstate1"
    static let defaultBackgroundImageCell2  = "resort"
}

enum FontConfig {
    static let bold                         = "AvenirNext-Bold"
    static let regular                      = "AvenirNext-Regular"
    static let demiBold                     = "AvenirNext-DemiBold"
    static let medium                       = "AvenirNext-Medium"
    static let demiBoldItalic               = "AvenirNext-DemiBoldItalic"
}


enum IconConfig {
    static let logoWithText                 = "HyphenLogo"
    static let filter                       = "FilterIcon"
    static let backArrow                    = "blackBackArrow"
    static let feed                         = "HomeIconGlyph"
    static let feedSelected                 = "HomeIconFilled"
    static let bid                          = "receipt"
    static let message                      = "Message"
    static let profile                      = "AccountIconGlyph"
    static let profileSelected              = "AccountIconFilled"
    static let passenger                    = "multipleProfile"
    static let color                        = "brush"
    static let date                         = "Calendar"
    static let car                          = "carShape"
    static let location                     = "location"
    static let wifiSymbol                   = "wifi"
    static let monitor                      = "monitor"
    static let moreArrow                    = "blackMoreArrow"
    static let serviceType                  = "shopping_cart"
    static let notes                        = "notes"
    static let binary                       = "openClosed"
    static let brand                        = "tagLabel"
    static let VIN                          = "VIN"
    static let airlineIcon                  = "airlineFlag"
    static let bed                          = "bedshape"
    static let airPlane                     = "planeShape"
    static let house                        = "homeShape"
    static let shipping                     = "boatShape"
    static let hotel                        = "bedShape"
}

enum ColorConfig {
    static let backgroundGray = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
    static let lightGray = UIColor(hexString: "EBEEF3")!
    static let black     = UIColor(hexString: "08080A")!
//    static let GrayText = UIColor(red: 175/255, green: 175/255, blue: 175/255, alpha: 1.0)
    static let GrayText = UIColor(hexString: "D8D8D8")!
    static let blue     = UIColor(red: 0/255, green: 136/255, blue: 255/255, alpha: 1.0)
    static let shadowColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1.0)
    static let shadowBorder = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
}
