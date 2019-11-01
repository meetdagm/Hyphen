//
//  ScrollingMenuPageViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/15/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class ScrollingMenuPageViewController {
    
    let topBarController: TopBarContainerViewController 
    let menuBarController: ScrollingMenuViewController
    let scrollingPageController: ScrollingPageViewController
    
    var controller: UIViewController {
        return topBarController
    }
    
    init(withTitleControllers controllers: [UIViewController]) {
        
        menuBarController = ScrollingMenuViewController(withTitles: controllers)
        scrollingPageController = ScrollingPageViewController(withViewControllers: controllers)
        topBarController = TopBarContainerViewController(withTopVC: menuBarController, withBottomVC: scrollingPageController)
        
        //Set scrolling delegate
        menuBarController.scrollingDelegate = scrollingPageController
        scrollingPageController.scrollingDelegate = menuBarController
    }
    
    
}
