//
//  KeyboardController.swift
//  
//
//  Created by Dagmawi Nadew-Assefa on 1/9/20.
//

import UIKit

class KeyboardController: UIViewController {
    
    private let childController: UIViewController 
    private var bottomConstraint: NSLayoutConstraint?
    
    private var childView: UIView {
        return childController.view
    }
    
    init(withChildController controller: UIViewController) {
        childController = controller
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        registerKeyboardNotification()
    }
    
    private func configureView() {
        addChildController()
    }
    
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppeared), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappeared), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardAppeared(_ notification: Notification) {
        changeFrame(by: -getKeyboardHeight(notification: notification))
    }
    
    private func getKeyboardHeight(notification: Notification) -> CGFloat {
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return 0 }
        let keyboardRectangle = keyboardFrame.cgRectValue
        return keyboardRectangle.height
    }
    
    private func changeFrame(by height: CGFloat) {
        bottomConstraint?.isActive = false
        UIView.animate(withDuration: 0.25) { 
            self.bottomConstraint?.constant = height
            self.bottomConstraint?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardDisappeared() {
        changeFrame(by: 0.0)
    }
    
    private func addChildController() {
        addChild(childController)
        view.addSubview(childView)
        addConstraints()
    }
    
    private func addConstraints() {
        childView.translatesAutoresizingMaskIntoConstraints = false
        childView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomConstraint = childView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        bottomConstraint?.isActive = true
        childView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        childView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    
    
    
}
