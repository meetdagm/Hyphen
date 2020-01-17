//
//  ImageController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 1/10/20.
//  Copyright © 2020 6irdview. All rights reserved.
//

import UIKit


class ImageController: UIViewController {
    
    var image: UIImage?
    
    var backgroundColor: UIColor = .black {
        didSet {
            view.backgroundColor = .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        createImageView()
    }
    
    private func createImageView(){
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        addConstraints(for: imageView)
    }
    
    private func addConstraints(for imageView: UIView) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}
