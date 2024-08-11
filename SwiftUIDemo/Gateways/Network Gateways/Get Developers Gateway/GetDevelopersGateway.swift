//
//  GetDevelopersGateway.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 12.08.24.
//

import Foundation

// MARK: - Get Developers Gateway
struct GetDevelopersGateway: GetDevelopersGatewayProtocol {
    func fetch() async throws -> [GetDevelopersEntity] {
        let urlString = "https://gist.github.com/rezojoglidze/d51dff6a9c0cb78f64bf37a2e8f31edd"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, respone): (Data, URLResponse) = try await URLSession.shared.data(for: request)
        
        let entity: [GetDevelopersEntity] = try JSONDecoder().decode([GetDevelopersEntity].self, from: data)
        
        return entity
    }
}
