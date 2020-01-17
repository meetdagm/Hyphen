//
//  TextFieldViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/31/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

protocol EditingDelegate: class  {
    func textField(didEnter text: String)
}

class TextFieldViewController: UIViewController, UITextFieldDelegate {
    
    private let mainView = TextFieldView()
    weak var editingDelegate: EditingDelegate?
    var valueEntered: ((_ value: String) -> Void)?
    
    var textField: UITextField {
        return mainView.textField
    }
    
    var accessoryIcon: UIImageView {
        return mainView.textFieldIcon
    }
    
    private func configureToolBar() -> UIToolbar {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = false
        toolBar.tintColor = .black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(closePicker))
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
    var placeholder: String? {
        didSet {
            mainView.textField.text = placeholder
        }
    }
    
    var keyboardType: UIKeyboardType = .default {
        didSet {
            textField.keyboardType = keyboardType
        }
    }
    
    init(withIcon icon: UIImage) {
        super.init(nibName: nil, bundle: nil)
        accessoryIcon.image = icon
    }
    
    convenience init() {
        self.init(withIcon: UIImage())
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
        textField.inputAccessoryView = configureToolBar()
        configureTarget()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != placeholder && textField.text == "" {
            textField.text = placeholder
        }
    }
    
    private func configureTarget() {
        textField.addTarget(self, action: #selector(textEntered), for: .editingChanged)
    }
    
    @objc private func textEntered(_ sender: UITextField) {
        if let delegate = editingDelegate, let enteredText = sender.text {
            delegate.textField(didEnter: enteredText)
            if let handler = valueEntered {
                handler(enteredText)
            }
        }
    }
    
    
   @objc func closePicker() {
        textField.resignFirstResponder()
    }
    
}
