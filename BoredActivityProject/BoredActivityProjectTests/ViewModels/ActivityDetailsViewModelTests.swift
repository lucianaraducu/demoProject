//
//  ActivityDetailsViewModelTests.swift
//  BoredActivityProjectTests
//
//  Created by Luciana Raducu on 20.11.21.
//

import XCTest
@testable import BoredActivityProject

class ActivityDetailsViewModelTests: XCTestCase {
    var sut: ActivityDetailsViewModel!
    var activityModel: ActivityModel!

    override func setUp() {
        super.setUp()
        activityModel = ActivityModel.create()
        sut = ActivityDetailsViewModel(activityModel: activityModel)
    }
    
    override func tearDown() {
        sut = nil
        activityModel = nil
        super.tearDown()
    }
    
    func testValues() {
        XCTAssertEqual(sut.activityName, String(format: "activity_name".localized, activityModel.activity))
        XCTAssertEqual(sut.numberOfParticipants, String(format: "activity_number_of_participants".localized, activityModel.participants))
        XCTAssertEqual(sut.activityColor, activityModel.type.color)
        XCTAssertEqual(sut.soundResource, activityModel.type.soundURL)
    }
    
    func testPriceConfiguration() {
        // Given
        let freeActivity = ActivityModel.create(price: 0)
        sut = ActivityDetailsViewModel(activityModel: freeActivity)
        
        // Then
        XCTAssertEqual(sut.price, "activity_cost_free".localized)
        
        // Given
        let pricedActivity = ActivityModel.create(price: 1.5)
        sut = ActivityDetailsViewModel(activityModel: pricedActivity)
        
        // Then
        XCTAssertEqual(sut.price, String(format: "activity_cost_value".localized, String(pricedActivity.price)))
    }
}
