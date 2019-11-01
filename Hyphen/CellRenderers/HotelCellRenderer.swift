//
//  HotelCellRenderer.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class HotelCellRenderer: CellRenderer {
    
    var cellType: UICollectionViewCell.Type {
        return HotelCell.self
    }
    
    func cellForItem(atIndexPath indexPath: IndexPath, fromCollectionView collectionView: UICollectionView) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath)
    }
    
}
