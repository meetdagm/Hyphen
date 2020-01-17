//
//  TextFieldView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/31/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class TextFieldView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let textField: UITextField = {
       
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = ""
        textField.font = UIFont(name: FontConfig.medium, size: 14)
        textField.textColor = .black
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 3))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let textFieldIcon: UIImageView = {
       
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        
        return imageView
    }()
    
    private func setupView() {
        
        addSubview(textField)
        addSubview(textFieldIcon)
        
        textFieldIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textFieldIcon.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textFieldIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        textFieldIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        textField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textField.leftAnchor.constraint(equalTo: textFieldIcon.rightAnchor, constant: 9.0).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -18).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

    }
    
}
