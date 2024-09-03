//
//  HomeViewModel.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 10.08.24.
//

import Foundation

// MARK: - Home View Model
final class HomeViewModel: ObservableObject {
    // MARK: Properties
    @Published private(set) var developers: [GetDevelopersEntity] = []
    
    // MARK: Properties - Cancellables
    private var getDevelopersTask: Task<Void, Never>? {
        willSet {
            getDevelopersTask?.cancel()
        }
    }
    
    // MARK: Lifecycle
    func didLoad() {
        getDevelopers()
    }
    
    // MARK: Requests
    private func getDevelopers() {
        getDevelopersTask = Task(operation: { @MainActor in
            do {
                let developers: [GetDevelopersEntity] = try await DIContainer.shared.networkGateways.getDevelopersGateway.fetch()
                guard !Task.isCancelled else { return }
                
                self.developers = developers
            } catch {
                guard !Task.isCancelled else { return }
                
                print(error.localizedDescription)
            }
        })
    }
}
