//
//  DatePickerView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/1/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class DatePickerViewController: TextFieldViewController {
    
    private var valueChanged: (Date) -> Void
    
    private var selectedDate: Date? {
        didSet {
            if let date = selectedDate {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM d, yyyy, EEEE"
                textField.text = dateFormatter.string(from: date)
                valueChanged(date)
            }
        }
    }
    
    convenience init() {
        self.init { (date) in
            print("Convenience Init")
        }
    }
    
    init(valueChangedHandler handler: @escaping(Date) -> Void) {
        valueChanged = handler
        super.init(withIcon: UIImage(named: IconConfig.date)!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePickerView()
        configureInitialState()
    }
    
    private func configureInitialState() {
        
    }
    
    private func configurePickerView() {
        textField.inputView = getDatePickerView()
        textField.inputAccessoryView = configureToolBar()
        textField.delegate = self
        textField.tintColor = .clear
    }
    
    private func getDatePickerView() -> UIView {
        let datePickerView = UIDatePicker()
        datePickerView.backgroundColor = .white
        datePickerView.tintColor = .black
        datePickerView.datePickerMode = .date
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        return datePickerView
    }
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        selectedDate = sender.date
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
    
    
//    @objc private func closePicker() {
//        textField.resignFirstResponder()
//    }
    
}

