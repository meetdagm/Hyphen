//
//  CellDimensionCalculator.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


protocol CellDimensionCalculator {
    func cellSize(in collectionView: UICollectionView) -> CGSize 
}

struct StaticCellSizeCalculator: CellDimensionCalculator {
    
    var sizeHandler: (UICollectionView) -> CGSize
    
    init(withSizeComputer computer: @escaping(UICollectionView) -> CGSize) {
        sizeHandler = computer
    }
    
    func cellSize(in collectionView: UICollectionView) -> CGSize {
        return sizeHandler(collectionView)
    }
    
    
}

struct CellSizeMultiplier: CellDimensionCalculator {
    
    private let widthMultiplier: CGFloat
    private let heightMultiplier: CGFloat
    
    
    init(withWidthMultiplier wMultiplier: CGFloat, withHeightMultiplier hMultiplier: CGFloat) {
        widthMultiplier = wMultiplier
        heightMultiplier = hMultiplier
    }
    
    func cellSize(in collectionView: UICollectionView) -> CGSize {
        return CGSize(width: collectionView.frame.width * widthMultiplier, height: collectionView.frame.height * heightMultiplier)
    }
    
}
