//
//  ScrollingMenuViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/15/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class ScrollingMenuViewController: UIViewController {
    
    let titles: [UIViewController]
    let mainView = ScrollingMenuView()
    weak var scrollingDelegate: ScrollingDelegate?
    
    init(withTitles titles: [UIViewController]) {
        self.titles = titles
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        titles = [UIViewController]()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        mainView.collectionDatasource = self
        mainView.collectionDelegate = self
        mainView.register(cell: TitleCell.self)
        mainView.selectInitialCell()
    }
    
    func scroll(toIndex index: Int) {
        mainView.selectItem(atIndex: index)
    }

}
