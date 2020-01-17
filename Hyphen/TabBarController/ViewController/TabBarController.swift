//
//  TabBarController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/22/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    init(withChildControllers controllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = controllers
        UITabBar.appearance().tintColor = ColorConfig.black
        UITabBar.appearance().unselectedItemTintColor = ColorConfig.black
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().backgroundColor = ColorConfig.lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
