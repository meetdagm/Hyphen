//
//  TextCellSelector.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/23/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class TextCellSelector: CellSelector {
    
    private var itemCollection: ItemCollection<DescribableText>
    var selectedText: ((_ text: DescribableText) -> ())?
    
    init(withCollection collection: ItemCollection<DescribableText>) {
        itemCollection = collection
    }
    
    func didSelectCell(at indexPath: IndexPath) {
        let selectedItem = itemCollection.item(atIndexPath: indexPath)
        if let handler = selectedText {
            handler(selectedItem)
        }
    }
    
}
