//
//  ToggableViewContoller.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/18/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class ToggableViewController: UIViewController {
    
    private let mainView = ToggableView()
    
    init(withTitle title: String) {
        super.init(nibName: nil, bundle: nil)
        mainView.titleDescription = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
    }
    
}
