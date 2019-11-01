//
//  TopBarContainerViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/14/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class TopBarContainerViewController: UIViewController {
    
    private let topVC: UIViewController
    private let bottomVC: UIViewController
    private let mainView = TopBarView()
    
    init(withTopVC topVC: UIViewController, withBottomVC bottomVC: UIViewController) {
        self.topVC = topVC
        self.bottomVC = bottomVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        topVC = UIViewController()
        bottomVC = UIViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildVC()
    }
    
    private func setupChildVC() {
        addChild(topVC)
        addChild(bottomVC)
        mainView.topView = topVC.view
        mainView.bottomView = bottomVC.view
        topVC.didMove(toParent: self)
        bottomVC.didMove(toParent: self)
    }
    
}
