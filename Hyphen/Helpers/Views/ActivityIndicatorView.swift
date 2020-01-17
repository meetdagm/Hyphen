//
//  ActivityIndicatorView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/27/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit
import MaterialActivityIndicator

class LoadingViewController: UIViewController {
    
    private let indicator = MaterialActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        indicator.startAnimating()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        indicator.stopAnimating()
    }
    
    func startAnimation(onTopOf viewController: UIViewController) {
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        viewController.present(self, animated: true, completion: nil)
    }
    
    func stopAnimation() {
        dismiss(animated: true, completion: nil)
    }
    
    private func configureView() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.addSubview(indicator)
        configureIndicator()
        setupIndicatorConstraint()
    }
    
    private func configureIndicator() {
        indicator.color = .white
    }
    
    private func setupIndicatorConstraint() {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
