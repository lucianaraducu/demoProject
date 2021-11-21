//
//  ActivityRequestViewModel.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import Foundation

class ActivityRequestViewModel {
    
    // MARK: - Private properties
    
    private let networkManager: NetworkManagerProtocol
    
    private var activityModel: ActivityModel? {
        didSet {
            self.modelUpdated?()
        }
    }
    
    // MARK: Exposed properties
    
    var startNewActivityText: String {
        "start_new_activity".localized
    }
    
    var viewNewActivityText: String {
        "view_new_activity".localized
    }
    
    var activityName: String? {
        activityModel?.activity
    }
    
    var nextViewModel: ActivityDetailsViewModel? {
        guard let activityModel = activityModel else { return nil }
        return ActivityDetailsViewModel(activityModel: activityModel)
    }
    
    var modelUpdated: (() -> Void)?
    
    // MARK: - Init
    
    init(
        networkManager: NetworkManagerProtocol
    ) {
        self.networkManager = networkManager
    }
    
    // MARK: Methods
    
    func requestActivity(completionHandler: @escaping (Result<Void, Error>) -> Void) {
        networkManager.fetchActivity { result in
            switch result {
            case let .success(activityModel):
                self.activityModel = activityModel
                completionHandler(.success(()))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
}
