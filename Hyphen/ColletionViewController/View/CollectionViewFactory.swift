//
//  CollectionViewFactory.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/2/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    var tempCellAttributesArray = [UICollectionViewLayoutAttributes]()
    let leftEdgeInset: CGFloat = 10
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let cellAttributesArray = super.layoutAttributesForElements(in: rect)
        //Oth position cellAttr is InConvience Emoji Cell, from 1st onwards info cells are there, thats why we start count from 2nd position.
        if(cellAttributesArray != nil && cellAttributesArray!.count > 1) {
            for i in 1..<(cellAttributesArray!.count) {
                let prevLayoutAttributes: UICollectionViewLayoutAttributes = cellAttributesArray![i - 1]
                let currentLayoutAttributes: UICollectionViewLayoutAttributes = cellAttributesArray![i]
                let maximumSpacing: CGFloat = 8
                let prevCellMaxX: CGFloat = prevLayoutAttributes.frame.maxX
                //UIEdgeInset 30 from left
                let collectionViewSectionWidth = self.collectionViewContentSize.width - leftEdgeInset
                let currentCellExpectedMaxX = prevCellMaxX + maximumSpacing + (currentLayoutAttributes.frame.size.width )
                if currentCellExpectedMaxX < collectionViewSectionWidth {
                    var frame: CGRect? = currentLayoutAttributes.frame
                    frame?.origin.x = prevCellMaxX + maximumSpacing
                    frame?.origin.y = prevLayoutAttributes.frame.origin.y
                    currentLayoutAttributes.frame = frame ?? CGRect.zero
                } else {
                    // self.shiftCellsToCenter()
                    currentLayoutAttributes.frame.origin.x = leftEdgeInset
                    //To Avoid InConvience Emoji Cell
                    if (prevLayoutAttributes.frame.origin.x != 0) {
                        currentLayoutAttributes.frame.origin.y = prevLayoutAttributes.frame.origin.y + prevLayoutAttributes.frame.size.height + 08
                    }
                }
                // print(currentLayoutAttributes.frame)
            }
            //print("Main For Loop End")
        }
        // self.shiftCellsToCenter()
        return cellAttributesArray
    }
    
    func shiftCellsToCenter() {
        if (tempCellAttributesArray.count == 0) {return}
        let lastCellLayoutAttributes = self.tempCellAttributesArray[self.tempCellAttributesArray.count-1]
        let lastCellMaxX: CGFloat = lastCellLayoutAttributes.frame.maxX
        let collectionViewSectionWidth = self.collectionViewContentSize.width - leftEdgeInset
        let xAxisDifference = collectionViewSectionWidth - lastCellMaxX
        if xAxisDifference > 0 {
            for each in self.tempCellAttributesArray{
                each.frame.origin.x += xAxisDifference/2
            }
        }
        
    }
}



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
        
        let layout = CollectionViewFlowLayout()
        layout.scrollDirection = direction
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.itemSize = CGSize.zero
        
        let cv = DynamicCollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        
        return cv
    }
    
    
}
