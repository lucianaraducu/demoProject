//
//  ActivityModel.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import Foundation

enum ActivityType: String, Codable {
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

struct ActivityModel: Codable {
    let activity: String
    let accessibility: Double
    let type: ActivityType
    let participants: Int
    let price: Double
    let link: String
    let key: String
}
