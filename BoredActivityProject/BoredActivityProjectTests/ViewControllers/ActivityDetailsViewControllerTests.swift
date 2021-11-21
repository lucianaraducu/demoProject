//
//  ActivityDetailsViewControllerTests.swift
//  BoredActivityProjectTests
//
//  Created by Luciana Raducu on 21.11.21.
//

@testable import BoredActivityProject
import XCTest

class ActivityDetailsViewControllerTests: XCTestCase {
    var sut: ActivityDetailsViewController!
    var viewModel: ActivityDetailsViewModel!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ActivityDetailsViewController") as? ActivityDetailsViewController
        viewModel = ActivityDetailsViewModel(activityModel: ActivityModel.create())
        sut.viewModel = viewModel
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        viewModel = nil
        super.tearDown()
    }

    func testTexts() {
        XCTAssertEqual(sut.activityName.text, viewModel.activityName)
        XCTAssertEqual(sut.price.text, viewModel.price)
        XCTAssertEqual(sut.numberOfPArticipants.text, viewModel.numberOfParticipants)
    }
    
    func testBackgroundColor() {
        XCTAssertEqual(sut.view.backgroundColor, viewModel.activityColor)
    }
}
