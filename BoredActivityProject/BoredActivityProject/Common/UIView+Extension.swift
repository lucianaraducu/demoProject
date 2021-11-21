//
//  UIView+Extension.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 21.11.21.
//

import UIKit

extension UIView {
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
