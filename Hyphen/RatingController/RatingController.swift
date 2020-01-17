//
//  RatingController.swift
//  
//
//  Created by Dagmawi Nadew-Assefa on 1/14/20.
//

import UIKit
import Cosmos

class RatingController: UIViewController  {
    
    var rating: Double = 0.0 {
        didSet {
            cosmosView.rating = rating
        }
    }
    
    var text: String? {
        didSet {
            cosmosView.text = text
        }
    }
    
    private var cosmosView: CosmosView = {
        let view = CosmosView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.settings.updateOnTouch = false
        view.settings.emptyColor = ColorConfig.GrayText
        view.settings.filledColor = ColorConfig.black
        view.settings.filledBorderColor = .clear
        view.settings.emptyBorderColor = .clear
        view.text = "(150 Review)"
        view.settings.textColor = ColorConfig.GrayText
        view.settings.textFont = UIFont(name: FontConfig.medium, size: 11)!
        
        return view
    }() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    private func configureView() {
        addStars()
    }
    
    private func addStars() {
        view.embedView(cosmosView)
    }
    
}
