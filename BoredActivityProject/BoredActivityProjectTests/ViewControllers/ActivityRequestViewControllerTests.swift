//
//  ActivityRequestViewControllerTests.swift
//  BoredActivityProjectTests
//
//  Created by Luciana Raducu on 21.11.21.
//

@testable import BoredActivityProject
import XCTest
import AVFAudio

class ActivityRequestViewControllerTests: XCTestCase {
    var sut: ActivityRequestViewController!
    var viewModel: ActivityRequestViewModel!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ActivityRequestViewController") as? ActivityRequestViewController
        viewModel = ActivityRequestViewModel(networkManager: NetworkManagerMock())
        sut.viewModel = viewModel
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        viewModel = nil
        super.tearDown()
    }

    func testUISetup() {
        XCTAssertEqual(sut.activityView.layer.cornerRadius, 10)
        XCTAssertEqual(sut.activityView.layer.borderWidth, 1)
        XCTAssertEqual(sut.activityView.layer.borderColor, UIColor.blue.cgColor)
        XCTAssertEqual(sut.activityView.layer.shadowColor, UIColor.black.cgColor)
        XCTAssertEqual(sut.activityView.layer.shadowRadius, 4.0)
    }
    
    func testInitialVisibilitySetup() {
        XCTAssertTrue(sut.showDetailsButton.isHidden)
        XCTAssertTrue(sut.activityView.isHidden)
        XCTAssertNil(sut.activityNameLabel.text)
    }
    
    func testTexts() {
        XCTAssertEqual(sut.activityNameLabel.text, viewModel.activityName)
        XCTAssertEqual(sut.startNewActivityButton.titleLabel?.text, viewModel.startNewActivityText)
        XCTAssertEqual(sut.showDetailsButton.titleLabel?.text, viewModel.viewNewActivityText)
    }
    
    func testUIUpdateAfterModelUpdate() {
        // Given
        let expectation = expectation(description: #function)
        
        // When
        //sut.startNewActivityButton.sendActions(for: .touchUpInside)
        sut.viewModel?.requestActivity { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    XCTAssertNotNil(self.sut.activityNameLabel.text)
                    XCTAssertFalse(self.sut.showDetailsButton.isHidden)
                    XCTAssertFalse(self.sut.activityView.isHidden)
                    expectation.fulfill()
                }
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
        }
        
        wait(for: [expectation], timeout: 5)
    }
}
