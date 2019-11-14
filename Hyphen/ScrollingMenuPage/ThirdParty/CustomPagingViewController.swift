//
//  CustomPagingViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/6/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit
import Parchment

class CustomPagingViewController: UIViewController {
    
    private let childController: FixedPagingViewController
    
    init(withChildController controller: FixedPagingViewController) {
        childController = controller
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
        configureLook()
        addChild(childController)
        addConstraint()
        childController.didMove(toParent: self)
    }
    
    private func configureLook() {
        childController.backgroundColor = ColorConfig.lightGray
        childController.menuBackgroundColor = ColorConfig.lightGray
        childController.selectedBackgroundColor = ColorConfig.lightGray
        
        childController.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        childController.selectedFont = .systemFont(ofSize: 16, weight: .medium)
        childController.textColor = ColorConfig.GrayText
        childController.selectedTextColor = .black
        childController.indicatorColor = .black
        childController.indicatorOptions = .visible(height: 1.0, zIndex: Int.max - 1, spacing: .zero, insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
        childController.borderOptions = .visible(height: 1.0, zIndex: Int.max - 1, insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        childController.borderColor = ColorConfig.lightGray
        childController.menuInsets = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
    }
    
    private func addConstraint() {
        if let childView = childController.view {
            view.backgroundColor = ColorConfig.lightGray
            childView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(childView)
            childView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
            childView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            childView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            childView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        }
    }
    
}
