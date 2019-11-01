//
//  ScrollingPageViewController+ScrollingDelegate.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/15/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation

extension ScrollingPageViewController: ScrollingDelegate {
    func didScroll(toIndex index: Int) {
      setViewControllers([childVCs[index]], direction: scrollDirection(forIndex: index), animated: true, completion: nil)
    }
}
