//
//  GetDevelopersGatewayProtocol.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 12.08.24.
//

import Foundation

// MARK: - Get Developers Gateway Protocol
protocol GetDevelopersGatewayProtocol {
    func fetch() async throws -> [GetDevelopersEntity]
}
