//
//  SegmentedViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/31/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class SegmentedViewController: UIViewController, ScrollingDelegate {
    
    private let mainView = SegmentedView()
    weak var selectionDelegate: ScrollingDelegate?
    private let segments: [UIViewController]
    
    init(withSegments segments: [UIViewController]) {
        self.segments = segments
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func didScroll(toIndex index: Int) {
        mainView.update(selectedIndex: index)
    }
    
    private func configureView() {
        addSegments()
        mainView.segmentedControl.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
    }
    
    @objc private func segmentValueChanged(_ sender: UISegmentedControl) {
        selectionDelegate?.didScroll(toIndex: sender.selectedSegmentIndex)
    }
    
    private func addSegments() {
        mainView.set(items: segments.map({ (controller) -> String in
            return controller.title ?? ""
        }))
    }
    
}
