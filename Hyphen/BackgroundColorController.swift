//
//  BackgroundColorController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/16/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class BackgroundColorController: UIViewController {
        
    private let topView = UIView()
    var addContraints: ((_ forView: UIView, _ onView: UIView) -> Void)?
    var topViewColor = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    private func configureView() {
        topView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topView)
        if let topViewConstraints = addContraints {
            topViewConstraints(view, topView)
        }
    }
    
}
