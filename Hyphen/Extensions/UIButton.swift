//
//  UIButton.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/20/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class ResizableButton: UIButton {
    
    override var intrinsicContentSize: CGSize {
        let titleWidth = self.titleLabel?.frame.width ?? 0
        print("Title Width: ", titleWidth)
        let imageWidth = self.imageView?.frame.width ?? 0
        print("Image width: ", imageWidth)
        let totalWidth = titleWidth + imageWidth
        print("Total Width: ", totalWidth)
        let titleHeight = self.titleLabel?.frame.height ?? 0
        return CGSize(width: totalWidth, height: titleHeight + 10)
    }
}
