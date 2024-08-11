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
    @Published private(set) var developers: [GetDevelopersEntity] = []
    
    // MARK: Properties - Cancellables
    private var getDevelopersTask: Task<Void, Never>?
    
    // MARK: Lifecycle
    func didLoad() {
        getDevelopers()
    }
    
    // MARK: Requests
    private func getDevelopers() {
        getDevelopersTask?.cancel()
        getDevelopersTask = Task(operation: {
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
