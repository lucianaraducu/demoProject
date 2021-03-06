//
//  String+Localized.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 20.11.21.
//

import Foundation

extension String {
    /// Gets the associated string from the Localizable file
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
