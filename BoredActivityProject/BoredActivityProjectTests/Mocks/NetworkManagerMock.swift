//
//  NetworkManagerMock.swift
//  BoredActivityProjectTests
//
//  Created by Luciana Raducu on 19.11.21.
//

import XCTest
@testable import BoredActivityProject

class NetworkManagerMock: NetworkManagerProtocol {
    var shouldSucceedRequest = true
    var activityModel: ActivityModel = ActivityModel.create()
    
    func fetchActivity(completionHandler: @escaping (Result<ActivityModel, Error>) -> Void) {
        if shouldSucceedRequest {
            completionHandler(.success(activityModel))
        } else {
            completionHandler(.failure(ActivityFetchError.activityRequestError))
        }
    }
}
