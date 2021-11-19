//
//  ActivityType+Properties.swift
//  BoredActivityProject
//
//  Created by Luciana Raducu on 19.11.21.
//

import UIKit

extension ActivityType {
    var color: UIColor {
        switch self {
        case .busywork:
            return .green
        case .education:
            return .yellow
        case .recreational:
            return .blue
        case .social:
            return .cyan
        case .diy:
            return .purple
        case .charity:
            return .systemPink
        case .cooking:
            return .lightGray
        case .relaxation:
            return .magenta
        case .music:
            return .red
        }
    }
    
    var soundURL: URL? {
        var resourceName: String?
        switch self {
        case .busywork:
            resourceName = "busy_work"
        case .education:
            resourceName = "education"
        case .recreational:
            resourceName = "recreational"
        case .social:
            resourceName = "social"
        case .diy:
            resourceName = "diy"
        case .charity:
            resourceName = "bell_sound"
        case .cooking:
            resourceName = "cooking"
        case .relaxation:
            resourceName = "relaxation"
        case .music:
            resourceName = "music"
        }
        
        return Bundle.main.url(forResource: resourceName, withExtension: "mp3")
    }
}
