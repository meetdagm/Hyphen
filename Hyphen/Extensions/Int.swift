//
//  Int.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/25/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import Foundation


extension Double {
    func format(withStyle style: NumberFormatter.Style) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = style
        return numberFormatter.string(from: NSNumber(floatLiteral: self)) ?? "None"
    }
}
