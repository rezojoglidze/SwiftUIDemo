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
        let urlString = "https://gist.githubusercontent.com/rezojoglidze/d51dff6a9c0cb78f64bf37a2e8f31edd/raw/a9c80aa4941f1b7e1251b05108670331f4bf518f/iOS_Devs"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response): (Data, URLResponse) = try await URLSession.shared.data(for: request)
        
        let entity: [GetDevelopersEntity] = try JSONDecoder().decode([GetDevelopersEntity].self, from: data)
        
        return entity
    }
}
