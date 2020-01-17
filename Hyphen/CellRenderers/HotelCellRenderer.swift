//
//  HotelCellRenderer.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class HotelCellRenderer: CellRenderer {
    
    var hotelCollection: ItemCollection<HotelModel>
    
    init(withCollection collection: ItemCollection<HotelModel>) {
        hotelCollection = collection
    }
    
    var cellType: UICollectionViewCell.Type {
        return HotelCell.self
    }
    
    func cellForItem(atIndexPath indexPath: IndexPath, fromCollectionView collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as? HotelCell
        let hotelItem = hotelCollection.item(atIndexPath: indexPath)
        cell?.hotelName.text = hotelItem.name
        cell?.originalPriceLabel.text = hotelItem.price
        cell?.discountedPriceLabel.text = ""
        cell?.backgroundImageView.kf.setImage(with: hotelItem.imageURL)
        return cell!
    }
    
}


class HotelCellSelector: CellSelector {
    
    var hotelCollection: ItemCollection<HotelModel>
    typealias CellSelection = (_ selectedModel: HotelModel) -> Void
    var selectionHandler: CellSelection
    
    init(withCollection collection: ItemCollection<HotelModel>, usingSelectionHandler handler: @escaping CellSelection) {
        hotelCollection = collection
        selectionHandler = handler
    }
    
    func didSelectCell(at indexPath: IndexPath) {
        selectionHandler(hotelCollection.item(atIndexPath: indexPath))
    }
    
}
