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
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0)
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
