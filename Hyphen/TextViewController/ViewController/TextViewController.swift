//
//  TextViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/31/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    //Set Font
    //Set TextColor
    //Set Text
    private let mainView = TextView()
    
    override func loadView() {
        self.view = mainView
    }
    
    func setText(color: UIColor) {
        mainView.textColor = color
    }
    
    func setText(_ text: String) {
        mainView.text = text
    }
    
    func setText(font: UIFont?) {
        mainView.font = font
    }
    
}
