//
//  ItemCollection.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/24/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation

class ItemCollection<ItemType>: CollectionModel {
  
    typealias Item = ItemType
    private var collection: [Item]
    
    var items: [Item] {
        return collection
    }
    
    init(withCollection collection: [Item]) {
        self.collection = collection
    }
    
    var numberOfItems: Int {
        return collection.count
    }
    
    func loadItems(_ handler: @escaping () -> ()) {
        handler()
    }
    
    func item(atIndexPath indexPath: IndexPath) -> Item {
        return collection[indexPath.row]
    }
    
    //update current array of items
    func updateCollection(with items: [Item]) {
        collection.append(contentsOf: items)
    }
    
    //overwrite current items of array 
    func overwriteCollection(with items: [Item]) {
        collection.removeAll()
        updateCollection(with: items)
    }
    
}
