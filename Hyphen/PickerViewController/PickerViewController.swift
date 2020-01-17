//
//  DropDownViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/31/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class PickerViewController: TextFieldViewController {

    private var pickerData: [String]
    private var valueChanged: (String) -> Void
    
    
    private var selectedData: String? {
        didSet {
            if let data = selectedData {
                textField.text = data
                valueChanged(data)
            }
        }
    }
    
    convenience init(withValueChangedHandler handler: @escaping (String) -> Void, icon: UIImage, data: [String]) {
        self.init(usingIcon: icon, withPickerData: data)
        valueChanged = handler
    }
    
    init(usingIcon icon: UIImage, withPickerData data: [String]) {
        pickerData = data
        valueChanged = { selectedText in
            print(selectedText)
        }
        super.init(withIcon: icon)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickerView()
        
    }
    
    private func configurePickerView() {
        textField.inputView = getPickerView()
        textField.inputAccessoryView = configureToolBar()
        textField.delegate = self
        textField.tintColor = .clear
        selectedData = pickerData.first
    }
    
    private func getPickerView() -> UIPickerView {
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.backgroundColor = .white
        pickerView.tintColor = .black
        
        return pickerView
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

    func setPicker(_ data: [String]) {
        pickerData = data
    }
}

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         selectedData = pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return pickerData[row]
    }
}
