//
//  HorizontalCollectionView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/16/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class CollectionView: UIView {
    
    private(set) var cellID = ""
    private let scrollDirection: UICollectionView.ScrollDirection
    
    init(withDirection direction: UICollectionView.ScrollDirection) {
        scrollDirection = direction
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isPagingEnabled: Bool? {
        didSet {
            collectionView.isPagingEnabled = isPagingEnabled!
        }
    }
    
    var collectionDelegate: UICollectionViewDelegate? {
        didSet {
            collectionView.delegate = collectionDelegate
        }
    }
    
    var collectionDatasource: UICollectionViewDataSource? {
        didSet {
            collectionView.dataSource = collectionDatasource
        }
    }
    
    
    lazy var collectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        let cv = DynamicCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        
        return cv
    }()
    
    private func setupView() {
        backgroundColor = .clear
        embedView(collectionView)
    }
    
    func register(cell: UICollectionViewCell.Type) {
        cellID = String(describing: cell)
        collectionView.register(cell, forCellWithReuseIdentifier: cellID)
    }
    
    func reloadCollectionView() {
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
}
