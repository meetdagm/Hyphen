//
//  TintColor.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 1/2/20.
//  Copyright © 2020 6irdview. All rights reserved.
//

import UIKit

func TintColor(_ frame: CGRect) -> UIColor {
    return UIColor(gradientStyle: .topToBottom, withFrame: frame, andColors: [UIColor.clear, UIColor.black.withAlphaComponent(0.3), UIColor.black.withAlphaComponent(0.4), .black])
}
