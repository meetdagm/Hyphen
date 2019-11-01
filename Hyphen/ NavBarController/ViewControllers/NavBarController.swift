//
//  NavBarController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/21/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class NavBarController: UIViewController {
    
    private let mainView = NavigationBarView()
    private let viewController: UIViewController
    typealias Handler = ()->()
    var rightButtonHandler:  Handler?
    
    init(withViewController controller: UIViewController, withTitle title: String, titleForRightBarButton rightButtonTitle: String = "") {
        viewController = controller
        super.init(nibName: nil, bundle: nil)
        mainView.navTitle = title
        mainView.rightButtonTitle = rightButtonTitle
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
        addChildren()
        addTargets()
    }
    
    private func addChildren() {
        addChild(viewController)
        mainView.bottomView = viewController.view
        viewController.didMove(toParent: self)
    }
    
    private func addTargets() {
        mainView.rightBarButtonItem.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
        mainView.backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
    
    @objc private func rightButtonPressed() {
        rightButtonHandler?()
    }
    
    @objc private func backButtonPressed() {
        dismissController()
    }
    
    private func dismissController() {
        dismiss(animated: true, completion: nil)
    }
    
}
