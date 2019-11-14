//
//  Setting.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/2/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation

struct SettingItem: DescribableText {
    var name: String
    var detail = ""
    
    var text: String {
        return name
    }
    
    var description: String {
        return detail
    }
}
