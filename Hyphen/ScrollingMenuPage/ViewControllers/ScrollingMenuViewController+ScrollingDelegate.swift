//
//  ScrollingMenuViewController+ScrollingDelegate.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/15/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation


extension ScrollingMenuViewController: ScrollingDelegate {
    func didScroll(toIndex index: Int) {
        scroll(toIndex: index)
    }
}
