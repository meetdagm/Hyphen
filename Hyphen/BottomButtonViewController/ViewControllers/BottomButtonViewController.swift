//
//  BottomButtonViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class BottomButtonViewController: UIViewController {
    private let mainView = BottomButtonView()
    private let topViewController: UIViewController
    
    init(usingButtonTitle title: String, withTopViewController controller: UIViewController) {
        topViewController = controller
        super.init(nibName: nil, bundle: nil)
        mainView.bottomButton.setTitle(title, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        addChildVCS()
        setupTarget()
    }
    
    private func addChildVCS() {
        addChild(topViewController)
        mainView.topView = topViewController.view
        topViewController.didMove(toParent: self)
    }
    
    private func setupTarget() {
        mainView.bottomButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        print("Button pressed")
    }
    
}
