//
//  NavigationControllerFactory.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/14/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class NavigationControllerFactory {
    
    static func makeController(withRootController controller: UIViewController, withBarColor color: UIColor = ColorConfig.lightGray, isLargeTitle: Bool = true) -> UINavigationController {

        let navController = UINavigationController(rootViewController: controller)
        navController.navigationBar.prefersLargeTitles = isLargeTitle
        navController.navigationBar.backgroundColor = color
        navController.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navController.navigationBar.isTranslucent = false
        navController.view.backgroundColor = color
        
        return navController
    }
    
}
