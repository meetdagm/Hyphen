//
//  BottomOverlayViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/16/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class BottomOverlayViewController: UIViewController {
    
    let mainView = BottomOverlayView()
    let bottomVC: UIViewController
    let overlayVC: UIViewController
    
    init(withBottomVC bottomVC: UIViewController, withOverlayVC overlayVC: UIViewController) {
        self.bottomVC = bottomVC
        self.overlayVC = overlayVC
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
        addChildren()
    }

    private func addChildren() {
        addChild(bottomVC)
        addChild(overlayVC)
        mainView.bottomView = bottomVC.view
        mainView.overlayView = overlayVC.view
        bottomVC.didMove(toParent: self)
        overlayVC.didMove(toParent: self)
    }
    
}
