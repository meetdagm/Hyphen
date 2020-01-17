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

    
    let map: MGLMapView = {
        let map = MGLMapView()
        map.setCenter(CLLocationCoordinate2D(latitude: 44.935408, longitude: -93.256798), zoomLevel: 15, animated: false)
        map.styleURL = MGLStyle.lightStyleURL
        map.translatesAutoresizingMaskIntoConstraints = false

        return map
    }()
    
    private func setupView() {
        embedView(map)
    }
}
