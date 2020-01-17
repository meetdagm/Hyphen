//
//  CellPresenter.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/27/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

protocol CellPresenter {
    func presentDetail(forItemAt index: IndexPath, overContext context: UIViewController)
}


