//
//  DefaultCollectionModel.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation

class DefaultCollectionModel: CollectionModel {
    
    private var itemAmount = 8
    
    var numberOfItems: Int {
        return itemAmount 
    }
    
    func loadItems(_ handler: @escaping () -> ()) {
        itemAmount += 9
        handler()
    }
    
}
