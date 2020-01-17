//
//  CollectionModel.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation


protocol CollectionModel {
    var numberOfItems: Int { get }
    func loadItems(_ handler: @escaping()->())
}

protocol ReadableCollectionModel: CollectionModel {
    associatedtype Item
    func item(atIndexPath indexPath: IndexPath) -> Item
}

//Collection
//class ReadableCollectionModel<Item>: CollectionModel {
//    
//    
//    
//    var itemCollection: [Item]
//    
//    var numberOfItems: Int {
//        return itemCollection.count
//    }
//    
//    init(withItems items: [Item]) {
//        itemCollection = items
//    }
//    
//    func loadItems(_ handler: @escaping () -> ()) {
//        handler()
//    }
//    
//    func item(atIndexPath indexPath: IndexPath) -> Item {
//        return itemCollection[indexPath.row]
//    }
//    
//}
