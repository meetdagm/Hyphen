//
//  ImageCellRenderers.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class ImageCellRenderer: CellRenderer {
    
    private var imageCollection: ItemCollection<Image>
    
    init(withImageCollection collection: ItemCollection<Image>) {
        imageCollection = collection
    }
    
    var cellType: UICollectionViewCell.Type {
        return ImageCell.self
    }
    
    func cellForItem(atIndexPath indexPath: IndexPath, fromCollectionView collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as? ImageCell
        if let imageName = imageCollection.item(atIndexPath: indexPath).backgroundImageName {
            cell?.imageView.image = UIImage(named: imageName)
        }
        return cell!
    }
    
}
