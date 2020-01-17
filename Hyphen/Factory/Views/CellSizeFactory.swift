//
//  CellSizeFactory.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

struct CellSizeFactory {
    
    static var smallCell: CellDimensionCalculator {
        return StaticCellSizeCalculator(withSizeComputer: { (collectionView) -> CGSize in
            return CGSize(width: 70, height: 25)
        })
    }
    
    static var hPreviewDefault: CellDimensionCalculator {
        return StaticCellSizeCalculator(withSizeComputer: { (collectionView) -> CGSize in
            return CGSize(width: collectionView.frame.width * 0.6, height: 150)
        })
    }
    
    static var fullSize: CellDimensionCalculator {
        
        return StaticCellSizeCalculator(withSizeComputer: { (collectionView) -> CGSize in
            return collectionView.frame.size
        })
    }
    
    static var vPreviewDefault: CellDimensionCalculator {
        return CellSizeMultiplier(withWidthMultiplier: 1.0, withHeightMultiplier: 1/10)
    }
    
    static var vDynamicCell: CellDimensionCalculator {
        return StaticCellSizeCalculator(withSizeComputer: { (collectionView) -> CGSize in
            print("CollectionView height for static: ", collectionView.frame.width)
            return CGSize(width: collectionView.frame.width, height: 35)
        })
    }
    
    static var vSettingCell: CellDimensionCalculator {
        return StaticCellSizeCalculator(withSizeComputer: { (collectionView) -> CGSize in
            print("CollectionView height for static: ", collectionView.frame.width)
            return CGSize(width: collectionView.frame.width, height: 55)
        })
    }
    
    static var vMessagePreviewCell: CellDimensionCalculator {
        return StaticCellSizeCalculator(withSizeComputer: { (collectionView) -> CGSize in
            return CGSize(width: collectionView.frame.width, height: 60)
        })
    }
    
    static var vBiddingPreviewCellSize: CellDimensionCalculator {
        return StaticCellSizeCalculator(withSizeComputer: { (collectionView) -> CGSize in
            return CGSize(width: collectionView.frame.width, height: 80)
        })
    }
    
    static var vFlightPreviewCellSize: CellDimensionCalculator {
        return StaticCellSizeCalculator(withSizeComputer: { (collectionView) -> CGSize in
            return CGSize(width: collectionView.frame.width, height: 100)
        })
    }
    
    static var homeCellSelection: CellDimensionCalculator {
        return StaticCellSizeCalculator(withSizeComputer: { (collectionView) -> CGSize in
            let dimension = (collectionView.frame.width / 2) - 13
            return CGSize(width: dimension, height: dimension)
        })
    }
}
