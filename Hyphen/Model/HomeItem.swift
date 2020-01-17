//
//  HomeItem.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/16/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class HomeItem {
    
    var title: String
    var iconName: String
    var controller: UIViewController
    
    init(withTitle title: String, withIcon icon: String, usingController controller: UIViewController) {
        self.title = title
        self.iconName = icon
        self.controller = controller
    }
    
    
}
