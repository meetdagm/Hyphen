//
//  ScrollingMenuView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/15/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class ScrollingMenuView: UIView {
    
    let cellID = "cellID"
    private var selectedTitleIndicatorLeftAnchor: NSLayoutConstraint?
    
    var menuColor: UIColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0) {
        didSet {
            collectionView.backgroundColor = menuColor
        }
    }
    
    var collectionDatasource: UICollectionViewDataSource? {
        didSet {
            collectionView.dataSource = collectionDatasource
        }
    }
    
    var collectionDelegate: UICollectionViewDelegate? {
        didSet {
            collectionView.delegate = collectionDelegate
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: .zero)
        setupView()
        
    }
    
    lazy var collectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = menuColor
        
        return cv
    }()
    
    let selectedTitleIndicator: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 3.0
        
        return view
    }()
    
    
    func register(cell: UICollectionViewCell.Type) {
        collectionView.register(cell, forCellWithReuseIdentifier: cellID)
    }
    
    func selectInitialCell() {
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
    }
    
    func selectItem(atIndex index: Int) {
        collectionView.selectItem(at: IndexPath(item: index, section: 0), animated: false, scrollPosition: [])
        scrollIndicatorToItem(atIndex: index)
    }
    
    func scrollIndicatorToItem(atIndex index: Int) {
        let leftAnchorConstant = CGFloat(index) * frame.width / 3
        selectedTitleIndicatorLeftAnchor?.constant = leftAnchorConstant
        UIView.animate(withDuration: 0.35) { 
            self.layoutIfNeeded()
        }
    }
    
    private func setupView() {
        
        addSubview(collectionView)
        addSubview(selectedTitleIndicator)
        
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        selectedTitleIndicator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        selectedTitleIndicator.heightAnchor.constraint(equalToConstant: 1.5).isActive = true
        selectedTitleIndicator.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        selectedTitleIndicatorLeftAnchor = selectedTitleIndicator.leftAnchor.constraint(equalTo: leftAnchor)
        selectedTitleIndicatorLeftAnchor?.isActive = true
        
    }
    
    
    
    
}
