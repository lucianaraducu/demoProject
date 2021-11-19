//
//  ActivityModel.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import Foundation

struct ActivityModel: Codable {
    let activity: String
    let accessibility: Double
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
}
