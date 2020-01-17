//
//  HorizontalCollectionViewController.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 10/16/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit


class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let mainView: CollectionView
    private var collectionModel: CollectionModel
    private let cellRenderer: CellRenderer
    var detailNavigator: DetailNavigator?
    var cellPresenter: CellPresenter?
    var cellSelector: CellSelector?
    var spacingBetweenItems: CGFloat = 30
    var spacingBetweenGroups: CGFloat = 30
    var insetForCollectionView: UIEdgeInsets = .zero
    var cellDimensionCalculator = CellSizeFactory.hPreviewDefault
    var numberOfSections = 1
    
    var isPagingEnabled = false {
        didSet {
            mainView.isPagingEnabled = isPagingEnabled
        }
    }
    
    init(withCollectionModel model: CollectionModel, usingCellRenderer renderer: CellRenderer, usingCollectionView collectionView: UICollectionView = CollectionViewFactory.getNormalCollectionView()) {
        collectionModel = model
        cellRenderer = renderer
        mainView = CollectionView(usingView: collectionView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        registerCell()
    }
    
    private func configureView() {
        mainView.collectionDelegate = self
        mainView.collectionDatasource = self
    }
    
    private func registerCell() {
        mainView.register(cell: cellRenderer.cellType)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionModel.numberOfItems
    }    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return cellRenderer.cellForItem(atIndexPath: indexPath, fromCollectionView: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellDimensionCalculator.cellSize(in: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellPresenter?.presentDetail(forItemAt: indexPath, overContext: self)
        cellSelector?.didSelectCell(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacingBetweenItems
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        print("Group spacing set as: \(spacingBetweenGroups)!!!!! ")
        return spacingBetweenGroups
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insetForCollectionView
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let offSetX = scrollView.contentOffset.x
        let contentWidth = scrollView.contentSize.width
        
        if offSetX > contentWidth - scrollView.frame.width {
            preFetchBatch()
        }
    }
    
    private func preFetchBatch() {
        collectionModel.loadItems { [weak self] in
            self?.mainView.reloadCollectionView()
        }
    }
    
    
    func update(_ collectionModel: CollectionModel) {
        self.collectionModel = collectionModel
        self.mainView.reloadCollectionView()
    }
    
    
    
}
