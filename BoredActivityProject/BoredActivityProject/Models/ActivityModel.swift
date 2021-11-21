//
//  ActivityModel.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import Foundation

/// ActivityType is a property of the ActivityModel
/// Each activity has a color and a sound resource asociated to it
enum ActivityType: String, Codable, CaseIterable, Hashable {
    case education
    case recreational
    case social
    case diy
    case charity
    case cooking
    case relaxation
    case music
    case busywork
}

/// ActivityModel contains the properties of an activity requested from the BoredAPI.
struct ActivityModel: Codable, Hashable {
    let activity: String
    let accessibility: Double
    let type: ActivityType
    let participants: Int
    let price: Double
    let link: String
    let key: String
}
