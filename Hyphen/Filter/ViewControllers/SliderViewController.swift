//
//  SliderViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/19/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {
    
    private let mainView = SliderView()
    private let sliderIncrementor: Int
    private var currentSliderValue: Float
    var valueChanged: ((Float) -> Void)?
    
    init(withTitle title: String, 
         withMinValue minValue: Float = 0, 
         withMaxValue maxValue: Float = 1, 
         withCurrentValue currentValue: Float = 0, 
         withSeparator separator: String = "+",
         incrementor: Int = 1) {
        
        sliderIncrementor = incrementor
        currentSliderValue = minValue
        
        super.init(nibName: nil, bundle: nil)
        
        mainView.title = title
        mainView.maxValue = maxValue
        mainView.minValue = minValue
        mainView.separator = separator
        mainView.currentValue = minValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTaget()
    }
    
    private func setupTaget() {
        mainView.slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    @objc private func sliderValueChanged(_ sender: UISlider) {
        if abs(sender.value - currentSliderValue) >= Float(sliderIncrementor) {
            currentSliderValue = sender.value - currentSliderValue > 0 ? currentSliderValue + Float(sliderIncrementor) : currentSliderValue - Float(sliderIncrementor)
            mainView.currentValue = currentSliderValue
            valueChanged?(currentSliderValue)
        }
    }
    
}
