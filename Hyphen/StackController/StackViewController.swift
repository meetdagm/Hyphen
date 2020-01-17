//
//  StackViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/31/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {
    
    private let childrenVCs: [UIViewController]
    private let stackView = UIStackView()
    var layoutMargins = UIEdgeInsets(top: 9.0, left: 18.0, bottom: 9.0, right: 18.0)
    
    init(withChildrenVC controllers: [UIViewController]) {
        childrenVCs = controllers
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
        confirureChildrenControllers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = layoutMargins
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        view.embedView(stackView)
    }
    
    private func confirureChildrenControllers() {
        childrenVCs.forEach {(childController) in
            addChild(childController)
            stackView.addArrangedSubview(childController.view)
            childController.didMove(toParent: self)
        }
    }
    
}
