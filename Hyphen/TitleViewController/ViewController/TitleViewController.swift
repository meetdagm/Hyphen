//
//  TitleViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/29/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class TitleViewController: UIViewController {
    
    private let mainView = TitleView()
    
    override func loadView() {
        self.view = mainView
    }
    
}
