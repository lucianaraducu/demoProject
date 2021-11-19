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
        "Activity name ➡️ " + activityModel.activity
    }
    
    var price: String {
        let priceInfo = "Price ➡️ "
        if activityModel.price == 0 {
            return  priceInfo + "This activity is free 🎉"
        } else {
            return priceInfo + "Price of this activity is \(String(activityModel.price)) 💰"
        }
    }
    
    var numberOfParticipants: String {
        "Number of participants ➡️ \(activityModel.participants) 👯‍♂️"
    }
    
    var activityColor: UIColor {
        activityModel.type.color
    }
    
    var soundResource: URL? {
        activityModel.type.soundURL
    }
    
    // MARK: - Init
    
    init(activityModel: ActivityModel) {
        self.activityModel = activityModel
    }
}
