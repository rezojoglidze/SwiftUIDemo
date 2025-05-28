//
//  DeveloperDetailsViewModelTests.swift
//  SwiftUIDemoTests
//
//  Created by Rezo Joglidze on 28.05.25.
//

import XCTest
@testable import SwiftUIDemo

@MainActor
final class DeveloperDetailsViewModelTests: XCTestCase {
    private var sut: DeveloperDetailsViewModel!
    
    override func setUp() {
        super.setUp()
        sut = DeveloperDetailsViewModel(parameters: .mock)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_title_returnsDeveloperName() {
        XCTAssertNotEqual(sut.title, "")
    }

    func test_subTitle_returnsDeveloperSurname() {
        XCTAssertNotEqual(sut.subTitle, "")
    }

    func test_currentCity_returnsDeveloperLocation() {
        XCTAssertNotEqual(sut.currentCity, "")
    }

    func test_description_returnsDeveloperAbout() {
        XCTAssertNotEqual(sut.description, "")
    }
}
