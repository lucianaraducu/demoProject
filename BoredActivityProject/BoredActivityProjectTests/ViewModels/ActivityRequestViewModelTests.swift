//
//  ActivityRequestViewModelTests.swift
//  BoredActivityProjectTests
//
//  Created by Luciana Raducu on 19.11.21.
//

@testable import BoredActivityProject
import XCTest

class ActivityRequestViewModelTests: XCTestCase {
    var sut: ActivityRequestViewModel!
    var networkManagerMock: NetworkManagerMock!
    
    override func setUp() {
        super.setUp()
        networkManagerMock = NetworkManagerMock()
        sut = ActivityRequestViewModel(networkManager: networkManagerMock)
    }

    override func tearDown() {
        sut = nil
        networkManagerMock = nil
        super.tearDown()
    }
    
    func testTexts() {
        XCTAssertEqual(sut.startNewActivityText, "start_new_activity".localized)
        XCTAssertEqual(sut.viewNewActivityText, "view_new_activity".localized)
    }
    
    func testModelUpdate_OnSuccessfulRequest() {
        // Given
        let expectation = expectation(description: #function)
        var modelUpdateCalled = false
        sut.modelUpdated = { modelUpdateCalled = true }
        
        // When
        sut.requestActivity { result in
            switch result {
            case .success:
                XCTAssertTrue(modelUpdateCalled)
                XCTAssertNotNil(self.sut.activityName)
                XCTAssertNotNil(self.sut.nextViewModel)
                expectation.fulfill()
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testModelUpdate_OnFailedRequest() {
        // Given
        let expectation = expectation(description: #function)
        networkManagerMock.shouldSucceedRequest = false
        var modelUpdateCalled = false
        sut.modelUpdated = { modelUpdateCalled = true }
        
        // When
        sut.requestActivity { result in
            switch result {
            case .success:
                XCTFail("Should be error")
            case .failure:
                XCTAssertFalse(modelUpdateCalled)
                XCTAssertNil(self.sut.activityName)
                XCTAssertNil(self.sut.nextViewModel)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 2)
    }
}
