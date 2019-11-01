//
//  DatePickerView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/1/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class DatePickerViewController: TextFieldViewController {
    
    private var selectedDate: Date? {
        didSet {
            if let date = selectedDate {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM d, yyyy, EEEE"
                textField.text = dateFormatter.string(from: date)
            }
        }
    }
    
    init() {
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
    
}

