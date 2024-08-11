//
//  DIContainer.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 12.08.24.
//

import Foundation

// MARK: - DIContainer
final class DIContainer {
    // MARK: Properties - Singleton
    static let shared: DIContainer = .init()

    // MARK: Properties - Gateways
    lazy var networkGateways: NetworkGateways = .init()
    
    // MARK: Initializers
    private init() {}
    
    // MARK: Network Gateways
    final class NetworkGateways {
        // MARK: Properties - Get Developers Gateweay
        lazy var getDevelopersGateway: GetDevelopersGatewayProtocol = GetDevelopersGateway()
    }
    
    // MARK: Preview Injection
#if DEBUG
    func injectPreviewDependencies() {
        networkGateways.getDevelopersGateway = MockGetDevelopersGateway()
    }
#endif
}
