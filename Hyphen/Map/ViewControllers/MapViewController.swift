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
    
    private var map: MGLMapView {
        return mainView.map
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
    }
    
    private func configureMap() {
        map.delegate = self
    }
    
    
    func add(_ annotations: [Locationable]) {
        annotations.forEach { (location) in
            map.addAnnotation(createAnnotation(using: location))
        }
        map.setCenter(getCenter(from: annotations), zoomLevel: 11.0, animated: true)
    }
    
    private func getCenter(from locations: [Locationable]) -> CLLocationCoordinate2D {
        
        var totalLat = 0.0
        var totalLong = 0.0 
        
        for location in locations {
            totalLat += location.lat
            totalLong += location.long
        }
        
        return CLLocationCoordinate2D(latitude: totalLat/Double(locations.count), longitude: totalLong/Double(locations.count))
    }
    
    private func createAnnotation(using location: Locationable) -> MGLPointAnnotation {
        let point = MGLPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: location.lat, longitude: location.long)
        
        return point
    }
    
}

extension MapViewController: MGLMapViewDelegate {
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        
        // Assign a reuse identifier to be used by both of the annotation views, taking advantage of their similarities.
        let reuseIdentifier = "reusableDotView"
        
        // For better performance, always try to reuse existing annotations.
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        
        // If there’s no reusable annotation view available, initialize a new one.
        if annotationView == nil {
            annotationView = MGLAnnotationView(reuseIdentifier: reuseIdentifier)
            annotationView?.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            annotationView?.layer.cornerRadius = (annotationView?.frame.size.width)! / 2
            annotationView?.layer.borderWidth = 4.0
            annotationView?.layer.borderColor = UIColor.white.cgColor
            annotationView!.backgroundColor = UIColor.green
            print("Annotation is nil")
//            UIColor(red: 0.03, green: 0.80, blue: 0.69, alpha: 1.0)
        }
        
        return annotationView
    }
    
    // This delegate method is where you tell the map to load an image for a specific annotation based on the willUseImage property of the custom subclass.
//    func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
//        
//        
//        // For better performance, always try to reuse existing annotations.
//        var annotationImage = map.dequeueReusableAnnotationImage(withIdentifier: "camera")
//        
//        // If there is no reusable annotation image available, initialize a new one.
//        if(annotationImage == nil) {
//            annotationImage = MGLAnnotationImage(image: UIImage(named: "camera")!, reuseIdentifier: "camera")
//        }
//        
//        return annotationImage
//    }
//    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always allow callouts to popup when annotations are tapped.
        return true
    }
}

