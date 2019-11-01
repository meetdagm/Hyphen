//
//  EqualSplitView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class EqualSplitView: UIView {
    
    var topView: UIView? {
        didSet {
            if let view = topView {
                addTop(view)
            }
        }
    }
    
    var bottomView: UIView? {
        didSet {
            if let view = bottomView {
                addBottom(view)
            }
        }
    }
    
    private func addTop(_ view: UIView) {
        addWidthContraint(toView: view)
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func addBottom(_ view: UIView) {
        addWidthContraint(toView: view)
        view.topAnchor.constraint(equalTo: centerYAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func addWidthContraint(toView view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
}
