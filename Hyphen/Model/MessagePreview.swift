//
//  MessagePreview.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/13/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation


struct MessagePreview: DescribableText {
    
    var name: String
    var chatPreview: String
    
    var text: String {
        return name
    }
    
    var description: String {
        return chatPreview
    }
    
}
