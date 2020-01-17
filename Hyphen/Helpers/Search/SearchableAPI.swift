//
//  SearchableAPI.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/10/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation


protocol SearchableAPI {
    func search(text: String, completionHandler: @escaping(_ items: CollectionModel) -> Void)
}
