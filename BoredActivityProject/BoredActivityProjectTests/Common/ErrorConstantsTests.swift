//
//  ErrorConstantsTests.swift
//  BoredActivityProjectTests
//
//  Created by Luciana Raducu on 20.11.21.
//

import XCTest
@testable import BoredActivityProject

class ErrorConstantsTests: XCTestCase {
    func testErrorMessages() {
        XCTAssertEqual(ActivityFetchError.activityRequestError.errorMessage, "error_activity_request_error".localized)
        XCTAssertEqual(ActivityFetchError.urlNotSetup.errorMessage, "error_incorect_url_for_activity".localized)
        XCTAssertEqual(ActivityFetchError.customError(message: "message").errorMessage, String(format: "error_common".localized, "message"))
    }
}
