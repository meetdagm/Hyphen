//
//  SearchTextField.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 12/3/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit

class SearchTextFieldController: UIViewController {
    
    var searchableAPI: SearchableAPI?
    var collectionModel: CollectionModel
    var resultCellRenderer: CellRenderer
    var resultCellSelector: CellSelector?
    
    private var searchNavController: UINavigationController?
    private let mainView = SearchTextFieldView()
    private var resultPreviewController: CollectionViewController?
    private let searchTextField = TextFieldViewController()
    
    
    init(withDescribableCollection collection: CollectionModel, resultCellRenderer cellRenderer: CellRenderer) {
        collectionModel = collection
        resultCellRenderer = cellRenderer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var navPlaceholder: String? {
        didSet {
            mainView.searchButton.setTitle(navPlaceholder, for: .normal)
        }
    }
    
    var setValue: String? {
        didSet {
            mainView.searchButton.setTitle(setValue, for: .normal)
        }
    }
    
    var placeholder: String?
    
    var searchIcon: UIImage? {
        didSet {
            mainView.searchButton.setImage(searchIcon, for: .normal)
        }
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    private func configureView() {
        configureTarget()
    }
    
    private func configureTarget() {
        mainView.searchButton.addTarget(self, action: #selector(presentSearchController), for: .touchUpInside)
    }
    
    @objc private func presentSearchController() {
        let searchController = getSearchController()
        searchController.modalTransitionStyle = .crossDissolve
        present(searchController, animated: true, completion: nil)
    }
    
    private func getSearchController() -> UIViewController {
        
        
        searchTextField.placeholder = placeholder
        searchTextField.editingDelegate = self
        
        resultPreviewController = CollectionViewController(withCollectionModel: collectionModel, 
                                                               usingCellRenderer: resultCellRenderer, 
                                                               usingCollectionView: CollectionViewFactory.getNormalCollectionView(inDirection: .vertical))
        resultPreviewController?.cellSelector = resultCellSelector
        resultPreviewController?.cellDimensionCalculator = CellSizeFactory.vSettingCell
        resultPreviewController?.spacingBetweenItems = .zero
        
        
        
        let searchCardView = CardViewController(withChildController: searchTextField)
        let expandableController = KeyboardController(withChildController: resultPreviewController!)
        let searchStack = StackViewController(withChildrenVC: [searchCardView, expandableController])
        searchStack.view.backgroundColor = ColorConfig.lightGray
        
        searchStack.title = navPlaceholder
        searchNavController = NavigationControllerFactory.makeController(withRootController: searchStack, isLargeTitle: false)
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissSearch))
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: nil, action: nil)
        cancelButton.tintColor = .black
        doneButton.tintColor = .black
        searchStack.navigationItem.leftBarButtonItem = cancelButton
        searchStack.navigationItem.rightBarButtonItem = doneButton
        
        return searchNavController!
    }
    
    
    @objc func dismissSearch() {
        searchNavController?.dismiss(animated: true, completion: nil)
    }

}

extension SearchTextFieldController: EditingDelegate {
    func textField(didEnter text: String) {
        if let searchAPI = searchableAPI {
            searchAPI.search(text: text, completionHandler: { [weak self] (collectionModel) in
                if let weakSelf = self {
                    DispatchQueue.main.async {
                        weakSelf.resultPreviewController?.update(collectionModel)
                    }
                }
            })
        }
    }
}
