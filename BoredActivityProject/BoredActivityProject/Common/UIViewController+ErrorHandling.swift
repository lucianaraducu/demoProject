//
//  UIViewController+ErrorHandling.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import Foundation
import UIKit

extension UIViewController {
    func presentErrorAlert(error: Error, completion: (() -> Void)? = nil) {
        let cancelText = error.errorMessage
        
        let action = UIAlertAction(title: cancelText, style: .default) { _ in
            completion?()
        }
        let alertController = UIAlertController(title: cancelText, message: nil, preferredStyle: .alert)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
