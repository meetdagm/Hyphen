//
//  CellSizeFactory.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

struct CellSizeFactory {
    
    static var hPreviewDefault: CellDimensionCalculator {
        return CellSizeMultiplier(withWidthMultiplier: 1/1.625, withHeightMultiplier: 0.9)
    }
    
    static var fullSize: CellDimensionCalculator {
        return CellSizeMultiplier(withWidthMultiplier: 1.0, withHeightMultiplier: 1.0)
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
    
}
