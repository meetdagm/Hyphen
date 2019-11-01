//
//  DynamicCollectionView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/29/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class DynamicCollectionView: UICollectionView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }    
}
