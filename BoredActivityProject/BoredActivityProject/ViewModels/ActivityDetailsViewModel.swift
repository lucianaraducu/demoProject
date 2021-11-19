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
        activityModel.activity
    }
    
    var price: String {
        if activityModel.price == 0 {
            return  "This activity is free 🎉"
        } else {
            return "Price of this activity is \(String(activityModel.price)) 💰"
        }
    }
    
    var numberOfParticipants: String {
        "Number of participants for this activity is \(activityModel.participants) 👯‍♂️"
    }
    
    // MARK: - Init
    
    init(activityModel: ActivityModel) {
        self.activityModel = activityModel
    }
}
