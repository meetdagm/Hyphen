//
//  DetailFactory.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/24/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

protocol DetailFactory {
    func makeDetailControllerForItem(atIndexPath indexPath: IndexPath) -> UIViewController
}
