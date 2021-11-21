//
//  UIViewController+ErrorHandling.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import Foundation
import UIKit

extension UIViewController {
    /// Presents an error alert with a single button that dismissed the alert when tapped
    /// - parameter error: Based on the error parameter, the message inside the alert is configured
    func presentErrorAlert(error: Error) {
        let cancelText = error.errorMessage
        
        let action = UIAlertAction(title: "ok", style: .default) {_ in }
        let alertController = UIAlertController(title: cancelText, message: nil, preferredStyle: .alert)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
