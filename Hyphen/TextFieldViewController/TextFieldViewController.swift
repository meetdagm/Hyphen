//
//  TextFieldViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/31/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class TextFieldViewController: UIViewController, UITextFieldDelegate {
    
    private let mainView = TextFieldView()
    
    var textField: UITextField {
        return mainView.textField
    }
    
    var accessoryIcon: UIImageView {
        return mainView.textFieldIcon
    }
    
    var placeholder: String? {
        didSet {
            mainView.textField.text = placeholder
        }
    }
    
    init(withIcon icon: UIImage) {
        super.init(nibName: nil, bundle: nil)
        accessoryIcon.image = icon
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != placeholder && textField.text == "" {
            textField.text = placeholder
        }
    }
    
}
