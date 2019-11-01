//
//  CardViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/31/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit 

class CardViewController: UIViewController {
    
    private let mainView = CardView()
    private let childController: UIViewController
    
    init(withChildController controller: UIViewController) {
        childController = controller
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(withChildController: UIViewController())
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildren()
    }
    
    private func addChildren() {
        addChild(childController)
        mainView.embedView(childController.view)
        childController.didMove(toParent: self)
    }
    
}
