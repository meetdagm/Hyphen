//
//  UILabel.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/18/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class PaddingLabel: UILabel {
    
    var paddingInset: UIEdgeInsets = .zero
    
    override func draw(_ rect: CGRect) {
        super.drawText(in: rect.inset(by: paddingInset))
    }
    
    override var intrinsicContentSize: CGSize {
        let superSize = super.intrinsicContentSize
        return CGSize(width: superSize.width + paddingInset.left + paddingInset.right,
                      height: superSize.height + paddingInset.top + paddingInset.bottom)
    }
    
}
