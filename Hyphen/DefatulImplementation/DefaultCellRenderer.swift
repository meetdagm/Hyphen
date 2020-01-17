//
//  DefaultCellRenderer.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class DefaultCellRenderer<TestingCell: UICollectionViewCell>: CellRenderer {
    
    var customizationHandler: ((_ cell: TestingCell, _ indexPath: IndexPath) -> Void)?
    
    var cellType: UICollectionViewCell.Type {
        return TestingCell.self
    }
    
    func cellForItem(atIndexPath indexPath: IndexPath, fromCollectionView collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as? TestingCell
        if let handler = customizationHandler, let cell = cell {
            handler(cell, indexPath)
        }
        return cell!
    }
    
}
