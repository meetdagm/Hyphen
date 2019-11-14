//
//  VerticalScrollStackController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/18/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class VerticalScrollStackController: UIViewController {
    
    let mainView = VerticalScrollStackView()
    let childVCS: [UIViewController]
    var inset: UIEdgeInsets = .zero {
        didSet {
            mainView.margins = inset
        }
    }
    
    init(withChildControllers childVCs: [UIViewController]) {
        self.childVCS = childVCs
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildControllers()
    }
    
    private func addChildControllers() {
        childVCS.forEach { (child) in
            addChild(child)
            mainView.addChild(child.view)
            child.didMove(toParent: self)
        }
    }
    
    
}
