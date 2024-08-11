//
//  MockGetDevelopersGateway.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 12.08.24.
//

import Foundation

// MARK: - Mock Get Developers Gateway
struct MockGetDevelopersGateway: GetDevelopersGatewayProtocol {
    func fetch() async throws -> [GetDevelopersEntity] {
        GetDevelopersEntity.mockArray
    }
}
