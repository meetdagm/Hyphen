//
//  ChatPreviewCellRenderer.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/13/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class ChatPreviewCellRenderer: CellRenderer {
    
    private let itemCollection: ItemCollection<MessagePreview>
    
    init(withItemCollection collection: ItemCollection<MessagePreview>) {
        itemCollection = collection
    }
    
    var cellType: UICollectionViewCell.Type {
        return ChatPreviewCell.self
    }
    
    func cellForItem(atIndexPath indexPath: IndexPath, fromCollectionView collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as? ChatPreviewCell else { fatalError()}
        let chatItem = itemCollection.item(atIndexPath: indexPath)
        cell.titleAcronymLabel.text = ("\(chatItem.name.first!)" + "\(chatItem.name.last!)").uppercased()
        cell.titleLabel.text = chatItem.name
        cell.descriptionLabel.text = chatItem.description
        cell.notificationLabel.text = "\(indexPath.row)"
        return cell        
    }
    
}
