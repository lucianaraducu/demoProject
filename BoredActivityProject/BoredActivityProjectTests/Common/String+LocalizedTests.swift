//
//  String+LocalizedTests.swift
//  BoredActivityProjectTests
//
//  Created by Luciana Raducu on 21.11.21.
//

@testable import BoredActivityProject
import XCTest

class String_LocalizedTests: XCTestCase {
    func testLocalizedSuccessful() {
        // Given
        let existingKey: String = "start_new_activity"
        
        // Then
        XCTAssertEqual(existingKey.localized, "Let's try out a new activity 🎉")
    }
    
    func testLocalizedNonExistingKey() {
        // Given
        let nonExistingKey: String = "some random text"
        
        // Then
        XCTAssertEqual(nonExistingKey.localized, nonExistingKey)
    }
}
