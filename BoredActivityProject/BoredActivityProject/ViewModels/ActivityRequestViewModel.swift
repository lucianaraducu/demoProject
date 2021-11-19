//
//  ActivityRequestViewModel.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import Foundation

class ActivityRequestViewModel {
    
    private var activityModel: ActivityModel?
    
    var activityName: String? {
        didSet {
            self.modelUpdated?()
        }
    }
    
    var nextViewModel: ActivityDetailsViewModel? {
        guard let activityModel = activityModel else { return nil }
        return ActivityDetailsViewModel(activityModel: activityModel)
    }
    
    var modelUpdated: (() -> Void)?
    
    private let networkManager: NetworkManager
    init(
        networkManager: NetworkManager
    ) {
        self.networkManager = networkManager
    }
    
    func requestActivity(completionHandler: @escaping (Result<Void, Error>) -> Void) {
        networkManager.fetchActivity { result in
            switch result {
            case let .success(activityModel):
                self.activityName = activityModel.activity
                self.activityModel = activityModel
                completionHandler(.success(()))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
}
