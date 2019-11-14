//
//  ExpandableTextViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/6/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class ExpandableTextViewController: UIViewController {
    
    private var textView: UITextView
    private var heightAnchor: NSLayoutConstraint?
    private var placeholderLabel: UILabel
    
    init(withPlaceholder placeholder: String) {
        textView = UITextView()
        placeholderLabel = UILabel()
        super.init(nibName: nil, bundle: nil)
        placeholderLabel.text = placeholder
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        configureTextView()
        configurePlaceholderLabel()
    }
    
    private func configurePlaceholderLabel() {
        placeholderLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        placeholderLabel.backgroundColor = .clear
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(placeholderLabel)
        placeholderLabel.leftAnchor.constraint(equalTo: textView.leftAnchor, constant: 7.0).isActive = true
        placeholderLabel.centerYAnchor.constraint(equalTo: textView.centerYAnchor).isActive = true
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    private func configureTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.tintColor = .black
        textView.font = UIFont.preferredFont(forTextStyle: .subheadline)
        textView.delegate = self
        view.addSubview(textView)
        textView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        heightAnchor = textView.heightAnchor.constraint(equalToConstant: 50)
        heightAnchor?.isActive = true
        textViewDidChange(textView)
    }
    
}

extension ExpandableTextViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        heightAnchor?.constant = estimatedSize.height
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
}
