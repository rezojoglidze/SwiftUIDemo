//
//  DIContainer.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 12.08.24.
//

import Foundation

// MARK: - DIContainer
final actor DIContainer {
    // MARK: Properties - Singleton
    static let shared: DIContainer = .init()

    // MARK: Properties - Gateways
    lazy var networkGateways: NetworkGateways = .init()
    
    // MARK: Initializers
    private init() {}
    
    // MARK: Network Gateways
    final actor NetworkGateways {
        // MARK: Properties - Get Developers Gateweay
        var getDevelopersGateway: GetDevelopersGatewayProtocol = GetDevelopersGateway() // Changed to var
    }
    
    // MARK: Preview Injection

    nonisolated func injectPreviewDependencies() {
        Task {
            await setPreviewDependencies()
        }
    }

    private func setPreviewDependencies() async {
        await networkGateways.setGetDevelopersGateway(MockGetDevelopersGateway())
    }
}

extension DIContainer.NetworkGateways {
    func setGetDevelopersGateway(_ gateway: GetDevelopersGatewayProtocol) async {
        self.getDevelopersGateway = gateway
    }
}
