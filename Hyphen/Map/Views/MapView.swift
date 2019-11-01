//
//  MapView.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/17/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit
import Mapbox

class MapView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
         super.layoutSubviews()
        setupView()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        setupView()
    }
    
    let filterButton: UIButton = {
       
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16.0
        button.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1.0
        button.setTitle("FILTER", for: .normal)
        button.setImage(UIImage(named: IconConfig.filter), for: .normal)
        button.titleLabel?.font = UIFont(name: FontConfig.demiBold, size: 12)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        print(button.intrinsicContentSize.width)
        
        return button
    }()

    
    let map: MGLMapView = {
        let map = MGLMapView()
        map.setCenter(CLLocationCoordinate2D(latitude: 44.935408, longitude: -93.256798), zoomLevel: 15, animated: false)
        map.styleURL = MGLStyle.lightStyleURL
        map.translatesAutoresizingMaskIntoConstraints = false

        return map
    }()
    
    private func setupView() {
        embedView(map)
        addSubview(filterButton)
        filterButton.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        filterButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        filterButton.widthAnchor.constraint(equalToConstant: 85).isActive = true
        filterButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
}
