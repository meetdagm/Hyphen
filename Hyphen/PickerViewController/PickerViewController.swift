//
//  DropDownViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/31/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class PickerViewController: TextFieldViewController {

    private let pickerData: [String]
    
    private var selectedData: String? {
        didSet {
            textField.text = selectedData
        }
    }
    
    init(usingIcon icon: UIImage, withPickerData data: [String]) {
        pickerData = data
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
