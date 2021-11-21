//
//  ActivityType+PropertiesTests.swift
//  BoredActivityProjectTests
//
//  Created by Luciana Raducu on 21.11.21.
//

@testable import BoredActivityProject
import XCTest

class ActivityType_PropertiesTests: XCTestCase {
    func testColors() {
        ActivityType.allCases.forEach { activity in
            switch activity {
            case .busywork:
                XCTAssertEqual(activity.color, .green)
            case .education:
                XCTAssertEqual(activity.color, .yellow)
            case .recreational:
                XCTAssertEqual(activity.color, .blue)
            case .social:
                XCTAssertEqual(activity.color, .cyan)
            case .diy:
                XCTAssertEqual(activity.color, .purple)
            case .charity:
                XCTAssertEqual(activity.color, .systemPink)
            case .cooking:
                XCTAssertEqual(activity.color, .lightGray)
            case .relaxation:
                XCTAssertEqual(activity.color, .magenta)
            case .music:
                XCTAssertEqual(activity.color, .red)
            }
        }
    }
    
    func testBoundleResource() {
        ActivityType.allCases.forEach { activity in
            switch activity {
            case .busywork:
                XCTAssertEqual(activity.soundURL?.lastPathComponent, "busy_work.mp3")
            case .education:
                XCTAssertEqual(activity.soundURL?.lastPathComponent, "education.mp3")
            case .recreational:
                XCTAssertEqual(activity.soundURL?.lastPathComponent, "recreational.mp3")
            case .social:
                XCTAssertEqual(activity.soundURL?.lastPathComponent, "social.mp3")
            case .diy:
                XCTAssertEqual(activity.soundURL?.lastPathComponent, "diy.mp3")
            case .charity:
                XCTAssertEqual(activity.soundURL?.lastPathComponent, "bell_sound.mp3")
            case .cooking:
                XCTAssertEqual(activity.soundURL?.lastPathComponent, "cooking.mp3")
            case .relaxation:
                XCTAssertEqual(activity.soundURL?.lastPathComponent, "relaxation.mp3")
            case .music:
                XCTAssertEqual(activity.soundURL?.lastPathComponent, "music.mp3")
            }
        }
    }
}
