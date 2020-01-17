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
    private let loadingView = LoadingViewController()
    private let topViewController: UIViewController
    var handler: (() -> Void)?
    
    var textColor: UIColor = .white {
        didSet {
            mainView.bottomButton.setTitleColor(textColor, for: .normal)
        }
    }
    
    var backgroundColor: UIColor = .black {
        didSet {
            mainView.bottomButton.backgroundColor = backgroundColor
        }
    }
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = mainView.bottomButton.backgroundColor
    }
    
    private func setupTarget() {
        mainView.bottomButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
    }
    
    @objc private func buttonPressed() {
        if let actionHandler = handler {
            actionHandler()
        }
    }
    
    func startSpinner() -> Void {
        loadingView.startAnimation(onTopOf: self)
    }
    
    func stopSpinner() -> Void {
        loadingView.stopAnimation()
    }
    
}
