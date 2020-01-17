//
//  HomeCellPresenter.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/18/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class HomeCellPresenter: CellPresenter {
    
    private var homeItemCollection: ItemCollection<HomeItem>
    
    init(withItemCollection collection: ItemCollection<HomeItem>) {
        homeItemCollection = collection
    }
    
    func presentDetail(forItemAt index: IndexPath, overContext context: UIViewController) {
        let item = homeItemCollection.item(atIndexPath: index)
        let itemController = item.controller
        itemController.modalTransitionStyle = .crossDissolve
        context.present(item.controller, animated: true, completion: nil)
    }
    
}
