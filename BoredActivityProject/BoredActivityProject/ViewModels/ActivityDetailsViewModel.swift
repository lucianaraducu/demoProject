//
//  ActivityDetailsViewModel.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import Foundation
import UIKit

class ActivityDetailsViewModel {
    
    // MARK: - Private properties
    
    private var activityModel: ActivityModel
    
    // MARK: - Exposed properties
    
    var activityName: String {
        String(format: "activity_name".localized, activityModel.activity)
    }
    
    var price: String {
        if activityModel.price == 0 {
            return  "activity_cost_free".localized
        } else {
            return String(format: "activity_cost_value".localized, String(activityModel.price))
        }
    }
    
    var numberOfParticipants: String {
        String(format: "activity_number_of_participants".localized, String(activityModel.participants))
    }
    
    var activityColor: UIColor {
        activityModel.type.color
    }
    
    var soundResource: URL? {
        activityModel.type.soundURL
    }
    
    // MARK: - Init
    
    init(
        activityModel: ActivityModel
    ) {
        self.activityModel = activityModel
    }
}
