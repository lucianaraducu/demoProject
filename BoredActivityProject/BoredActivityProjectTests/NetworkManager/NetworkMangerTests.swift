//
//  NetworkMangerTests.swift
//  BoredActivityProjectTests
//
//  Created by Luciana Raducu on 21.11.21.
//

@testable import BoredActivityProject
import XCTest

class NetworkMangerTests: XCTestCase {
    var urlSession: URLSession!
    var sut: NetworkManager!

    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: configuration)
        sut = NetworkManager(urlSession: urlSession)
    }
    
    override func tearDown() {
        urlSession = nil
        sut = nil
        super.tearDown()
    }
    
    func testGetRandomActivity_Successful() {
        // Given
        let expectation = XCTestExpectation(description: #function)
        let activityMock = ActivityModel.create()
        guard let mockData = try? JSONEncoder().encode(activityMock) else {
            XCTFail("MockData sould be setup")
            return
        }

        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), mockData)
        }

        // When
        sut.fetchActivity { result in
            switch result {
            case let .success(activity):
                // Then
                XCTAssertEqual(activity, activityMock)
                expectation.fulfill()
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
        }

        wait(for: [expectation], timeout: 5)
    }
    
    func testGetRandomActivity_ActivityRequestError() {
        // Given
        let expectation = XCTestExpectation(description: #function)
        let activityMock = ActivityModel.create()
        guard let mockData = try? JSONEncoder().encode(activityMock) else {
            XCTFail("MockData sould be setup")
            return
        }

        let errorResponse = HTTPURLResponse(url: URL(string: "www.google.com")!,
                                            statusCode: 404,
                                            httpVersion: nil,
                                            headerFields: nil)!
        MockURLProtocol.requestHandler = { request in
            return (errorResponse, mockData)
        }

        // When
        sut.fetchActivity { result in
            switch result {
            case .success:
                XCTFail("Should be error")
            case let .failure(error):
                // Then
                XCTAssertNotNil(error as? ActivityFetchError)
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 5)
    }
}
