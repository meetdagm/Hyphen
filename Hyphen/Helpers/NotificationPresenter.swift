//
//  NotificationPresenter.swift
//  Hyphen
//
//  Created by Dagmawi Nadew-Assefa on 1/2/20.
//  Copyright © 2020 6irdview. All rights reserved.
//

import UIKit


func PresentNotification(usingTitle title: String = "Oops!", _ message: String, usingController controller: UIViewController, _ action: UIAlertAction?) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    if let alertAction = action {
        alertController.addAction(alertAction)
    }
    alertController.addAction(CreateCancelAction())
    controller.present(alertController, animated: true, completion: nil)
}

fileprivate func CreateCancelAction() -> UIAlertAction {
    return UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
}
