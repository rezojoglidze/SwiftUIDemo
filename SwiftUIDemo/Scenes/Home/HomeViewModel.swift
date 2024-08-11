//
//  HomeViewModel.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 10.08.24.
//

import Foundation
import RJSwiftMacros
import RJSwiftCommon

// MARK: - Home View Model
@MainActor
final class HomeViewModel: ObservableObject {
    // MARK: Properties
    @Published private(set) var developers: [Person] = [.mock, .mock, .mock]
    
    // MARK: Requests
    private func loadDevelopers() {
        
    }
}


@MockBuilder()
struct Person: Equatable, Hashable {
    let uuid: UUID
    let name: String
    let surname: String
    
    // MARK: Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
