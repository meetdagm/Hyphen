//
//  SegmentedView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/31/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class SegmentedView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let segmentedControl: UISegmentedControl = {
       
        let view = UISegmentedControl(items: ["First", "Second"])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 2.0
        view.tintColor = .black
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.masksToBounds = true
        view.selectedSegmentIndex = 0
        
        return view
    }()
    
    private func setupView() {
        addSubview(segmentedControl)
        segmentedControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 35).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        segmentedControl.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
    }
    
    func update(selectedIndex index: Int) {
        segmentedControl.selectedSegmentIndex = index
    }
    
    func set(items: [String]) {
        for (index, item) in items.enumerated() {
            segmentedControl.setTitle(item, forSegmentAt: index)
        }
    }
    
}
