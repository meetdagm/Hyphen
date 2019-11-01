//
//  CustomPageViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/15/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class ScrollingPageViewController: UIPageViewController {
    
    let childVCs: [UIViewController]

    weak var scrollingDelegate: ScrollingDelegate?
    
    init(withViewControllers viewControllers: [UIViewController]) {
        self.childVCs = viewControllers
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        self.childVCs = [UIViewController]()
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
    }
    
    private func configureController() {
        guard let firstVC = childVCs.first 
            else { fatalError("Can't find the first VC in array of VC's for pageViewController") }
        setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        dataSource = self
        delegate = self
    }
    
    func indexOfCurrentVC() -> Int {
        guard let currentVC = viewControllers?.first, let index = childVCs.firstIndex(of: currentVC) 
            else { fatalError("Can't find Index of current VC")}
        return index
    }
    
    func scrollDirection(forIndex index: Int) -> UIPageViewController.NavigationDirection {
        if indexOfCurrentVC() < index {
            return .forward
        }
        return .reverse
    }

}
