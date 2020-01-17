//
//  FlightCellRenderer.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 11/25/19.
//  Copyright © 2019 6irdview. All rights reserved.
//

import UIKit
import Kingfisher

class FlightCellRenderer: CellRenderer, CellPresenter {
    
    private var viewModel: FlightPreviewViewModel
    
    init(withPreviewViewModel model: FlightPreviewViewModel) {
        viewModel = model
    }
    
    var cellType: UICollectionViewCell.Type {
        return FlightPreviewCell.self
    }
    
    func cellForItem(atIndexPath indexPath: IndexPath, fromCollectionView collectionView: UICollectionView) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as? FlightPreviewCell else { return UICollectionViewCell() }
        cell.titleLabel.text = viewModel.getPrice(forItemAt: indexPath.row)
        cell.centerStackedLabel.bottomLabelText = viewModel.getDuration(forItemAt: indexPath.row)
        cell.rightStackedLabel.bottomLabelText = viewModel.getStopsAmt(forItemAt: indexPath.row)
        cell.leftStackedLabel.bottomLabelText = viewModel.getDestinationArrivalTime(forItemAt: indexPath.row)
        cell.leftStackedLabel.topLabelText = viewModel.getTripRoute(forItemAt: indexPath.row)
        let iconURL = URL(string: viewModel.getCarrierImageUrl(forItemAt: indexPath.row))
        cell.iconView.kf.setImage(with: iconURL)
        
        return cell
    }
    
    func presentDetail(forItemAt index: IndexPath, overContext context: UIViewController) {
        if let bookingURL = viewModel.getBookingURL(forItemAt: index.row) {
            UIApplication.shared.open(bookingURL, options: [:], completionHandler: nil)
        }
    }
    
    
}
