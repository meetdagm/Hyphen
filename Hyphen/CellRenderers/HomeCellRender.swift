//
//  HomeCellRender.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/12/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class HomeCellRenderer: CellRenderer {
    
    private var vcCollection: ItemCollection<HomeItem>
    
    init(withVCCollection collection: ItemCollection<HomeItem>) {
        vcCollection = collection
    }
    
    var cellType: UICollectionViewCell.Type {
        return ViewControllerSelectionCell.self
    }
    
    func cellForItem(atIndexPath indexPath: IndexPath, fromCollectionView collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as? ViewControllerSelectionCell
        let item = vcCollection.item(atIndexPath: indexPath)
        cell?.titleLabel.text = item.title
        cell?.iconView.image = UIImage(named: item.iconName)
        return cell!
    }
    
}
