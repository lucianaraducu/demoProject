//
//  ErrorConstants.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

extension Error {
    var errorMessage: String {
        if let activityError = self as? ActivityFetchError {
            switch activityError {
            case .activityNotFound:
                return "Activity was not found."
            case .urlNotSetup:
                return "Why did you not set the url correctly?"
            case .customError(let message):
                return "Something went wrong \(message)"
            }
        } else {
            return localizedDescription
        }
    }
}
