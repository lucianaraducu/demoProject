//
//  UIView+Extension.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 21.11.21.
//

import UIKit

extension UIView {
    /// Ads a custom layer to any view
    /// - parameter cornerRadius: Sets the corner radius of the view
    /// - parameter borderWidth: Sets the border width of the view
    /// - parameter borderColor: Sets the color of the border
    /// - parameter shadowColor: Sets the shadow color of the view
    /// - parameter shadowRadius: Sets the shadow radius of the view
    func addLayer(
        cornerRadius: Double = 10,
        borderWidth: Double = 1,
        borderColor: CGColor = UIColor.white.cgColor,
        shadowColor: CGColor = UIColor.black.cgColor,
        shadowRadius: Double = 4.0
    ) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        layer.shadowColor = shadowColor
        layer.shadowRadius = shadowRadius
    }
}
