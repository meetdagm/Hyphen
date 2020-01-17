//
//  ZAxisOverlayController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/16/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class ZAxisOverlayController: UIViewController {
    
    private let childControllers: [UIViewController]
    
    init(withChildControllers controllers: [UIViewController]) {
        childControllers = controllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    private func configureView() {
        for controller in childControllers {
            addChildVC(controller)
        }
    }
    
    private func addChildVC(_ controller: UIViewController) {
        addChild(controller)
        view.embedView(controller.view)
        controller.didMove(toParent: self)
    }
    
    
}
