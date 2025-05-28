//
//  HomeViewModelTests.swift
//  SwiftUIDemoTests
//
//  Created by Rezo Joglidze on 28.05.25.
//

import XCTest
@testable import SwiftUIDemo
import Combine

@MainActor
final class HomeViewModelTests: XCTestCase {
    private var sut: HomeViewModel!
    
    private var subsricption = Set<AnyCancellable>()
    
    override func setUp()  {
        super.setUp()
        
        DIContainer.shared.injectPreviewDependencies()
        sut = HomeViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_getDevelopers() async throws {
        await sut.didLoad()
        
        let developers = sut.developers
        print(developers.count, "nilnilnilnil", developers.first?.name ?? "nil")
        XCTAssertNotEqual(developers.first?.name, "dd")
        XCTAssertNotEqual(developers.count, 0)
    }
}
