//
//  MapViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/17/19.
//  Copyright © 2019 6irdview. All rights reserved.
//


import UIKit
import Mapbox

class MapViewController: UIViewController {
    
    private let mainView = MapView()
    var filterController: UIViewController?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTarget()
    }
    
    private func setupTarget() {
        mainView.filterButton.addTarget(self, action: #selector(presentFilter), for: .touchUpInside)
    }
    
    @objc private func presentFilter() {
        guard let controller = filterController else { fatalError() }
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true, completion: nil)
    }
    
}

