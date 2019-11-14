//
//  CollectionViewFactory.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/2/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class CollectionViewFactory {
    
    static func getNormalCollectionView(inDirection direction: UICollectionView.ScrollDirection = .horizontal) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = direction
        let cv = DynamicCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }
    
    static func getDynamicCellCollectionView(inDirection direction: UICollectionView.ScrollDirection = .horizontal) -> UICollectionView {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = direction
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = DynamicCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        
        return cv
    }
    
    
}
