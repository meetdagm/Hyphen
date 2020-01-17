//
//  TextCellRenderer.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/2/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class TextCellRenderer: CellRenderer {
    
    private let textCollection: ItemCollection<DescribableText>
    
    init(withCollection collection: ItemCollection<DescribableText>) {
        textCollection = collection
    }
    
    var cellType: UICollectionViewCell.Type {
        return TextCell.self
    }
    
    func cellForItem(atIndexPath indexPath: IndexPath, fromCollectionView collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as? TextCell
        let data = textCollection.item(atIndexPath: indexPath)
        cell?.descriptionLabel.text = data.description
        cell?.textLabel.text = data.text
        return cell!
    }
    
}


class AirportTextCellRenderer: CellRenderer {
    private let textCollection: ItemCollection<Airport>
    
    init(withCollection collection: ItemCollection<Airport>) {
        textCollection = collection
    }
    
    var cellType: UICollectionViewCell.Type {
        return TextCell.self
    }
    
    func cellForItem(atIndexPath indexPath: IndexPath, fromCollectionView collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as? TextCell
        let data = textCollection.item(atIndexPath: indexPath)
        cell?.descriptionLabel.text = data.description
        cell?.textLabel.text = data.text
        return cell!
    }
}
