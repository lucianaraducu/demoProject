//
//  ErrorConstants.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import UIKit

extension Error {
    var errorMessage: String {
        if let activityError = self as? ActivityFetchError {
            switch activityError {
            case .activityRequestError:
                return "error_activity_request_error".localized
            case .urlNotSetup:
                return "error_incorect_url_for_activity".localized
            case .customError(let message):
                return String(format: "error_common".localized, message)
            }
        } else {
            return localizedDescription
        }
    }
}
