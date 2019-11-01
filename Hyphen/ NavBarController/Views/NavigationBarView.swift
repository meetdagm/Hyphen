//
//  NavigationBarView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/21/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class NavigationBarView: UIView {
    
    var bottomView: UIView? {
        didSet {
            if let view = bottomView {
                addToContainer(view: view)
            }
        }
    }
    
    var rightButtonTitle: String? {
        didSet {
            rightBarButtonItem.setTitle(rightButtonTitle, for: .normal)
        }
    }
    
    var navTitle: String? {
        didSet {
            navBarTitle.text = navTitle
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let navBarView: CardView = {
       
        let view = CardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let navBarTitle: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Filters"
        label.textColor = .black
        label.font = UIFont(name: FontConfig.demiBold, size: 16)
        
        return label
    }()
    
    let rightBarButtonItem: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: FontConfig.medium, size: 14)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Reset", for: .normal)
        
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: IconConfig.backArrow), for: .normal)
        
        return button
    }()
    
    private func addToContainer(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.topAnchor.constraint(equalTo: navBarView.bottomAnchor, constant: 11).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func setupView() {
        
        backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
        addSubview(navBarView)
        navBarView.addSubview(navBarTitle)
        navBarView.addSubview(rightBarButtonItem)
        navBarView.addSubview(backButton)
        
        navBarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 6).isActive = true
        navBarView.leftAnchor.constraint(equalTo: leftAnchor, constant: 6.0).isActive = true
        navBarView.rightAnchor.constraint(equalTo: rightAnchor, constant: -6.0).isActive = true
        navBarView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        navBarTitle.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        navBarTitle.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor).isActive = true
        
        rightBarButtonItem.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor).isActive = true
        rightBarButtonItem.rightAnchor.constraint(equalTo: navBarView.rightAnchor, constant: -20).isActive = true
        
        backButton.centerYAnchor.constraint(equalTo: navBarView.centerYAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: navBarView.leftAnchor, constant: 20).isActive = true
        
    }
    
}
