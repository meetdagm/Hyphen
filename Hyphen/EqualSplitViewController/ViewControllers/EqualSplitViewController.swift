//
//  EqualSplitViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class EqualSplitViewController: UIViewController {
    
    private let mainView = EqualSplitView()
    private let topViewController: UIViewController
    private let bottomViewController: UIViewController
    
    init(withTopViewController topController: UIViewController, withBottomViewController bottomController: UIViewController) {
        topViewController = topController
        bottomViewController = bottomController
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
        configureView()
    }
    
    private func configureView() {
        addChildVCs()
    }
    
    private func addChildVCs() {
        addChild(topViewController)
        addChild(bottomViewController)
        mainView.topView = topViewController.view
        mainView.bottomView = bottomViewController.view
        topViewController.didMove(toParent: self)
        bottomViewController.didMove(toParent: self)
    }
    
    
}
