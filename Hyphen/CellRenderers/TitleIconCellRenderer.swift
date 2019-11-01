//
//  TitleIconCellRenderer.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/29/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class TitleIconCellRenderer: CellRenderer {
    
    var cellType: UICollectionViewCell.Type {
        return TitleIconCell.self
    }
    
    func cellForItem(atIndexPath indexPath: IndexPath, fromCollectionView collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as? TitleIconCell
        cell?.titleLabel.text = "Complimentary wifi"
        cell?.backgroundColor = .clear
        
        return cell!
    }
    
    
}
