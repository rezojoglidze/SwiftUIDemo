//
//  HomeViewModel.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 10.08.24.
//

import Foundation

// MARK: - Home View Model
@MainActor
@Observable
final class HomeViewModel: ObservableObject {
    // MARK: Properties
    private(set) var developers: [GetDevelopersEntity] = []
    
    // MARK: Lifecycle
    func didLoad() {
        getDevelopers()
    }
    
    // MARK: Requests
    private func getDevelopers() {
        Task {
            do {
                let developers: [GetDevelopersEntity] = try await DIContainer.shared.networkGateways.getDevelopersGateway.fetch()
                guard !Task.isCancelled else { return }
                
                self.developers = developers
            } catch {
                guard !Task.isCancelled else { return }
                
                print(error.localizedDescription)
            }
        }
    }
}
