//
//  UIView+ExtensionsTests.swift
//  BoredActivityProjectTests
//
//  Created by Luciana Raducu on 21.11.21.
//

@testable import BoredActivityProject
import XCTest

class UIView_ExtensionsTests: XCTestCase {
    func testAddLayer_DefaultValues() {
        // Given
        let view = UIView()
        
        // When
        view.addLayer()
        
        // Then
        XCTAssertEqual(view.layer.cornerRadius, 10)
        XCTAssertEqual(view.layer.borderWidth, 1)
        XCTAssertEqual(view.layer.borderColor, UIColor.white.cgColor)
        XCTAssertEqual(view.layer.shadowColor, UIColor.black.cgColor)
        XCTAssertEqual(view.layer.shadowRadius, 4.0)
    }
    
    func testAddLayer_CustomValues() {
        // Given
        let view = UIView()
        let cornerRadius = 15.0
        let borderWidth = 3.0
        let borderColor = UIColor.yellow.cgColor
        let shadowColor = UIColor.yellow.cgColor
        let shadowRadius = 15.0
        
        // When
        view.addLayer(
            cornerRadius: cornerRadius,
            borderWidth: borderWidth,
            borderColor: borderColor,
            shadowColor: shadowColor,
            shadowRadius: shadowRadius
        )
        
        // Then
        XCTAssertEqual(view.layer.cornerRadius, cornerRadius)
        XCTAssertEqual(view.layer.borderWidth, borderWidth)
        XCTAssertEqual(view.layer.borderColor, borderColor)
        XCTAssertEqual(view.layer.shadowColor, shadowColor)
        XCTAssertEqual(view.layer.shadowRadius, shadowRadius)
    }
}
