//
//  GetDevelopersEntity.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 12.08.24.
//

import Foundation
import RJSwiftMacros
import RJSwiftCommon

@CodingKeys()
@MockBuilder(numberOfItems: 10)
struct GetDevelopersEntity: Decodable, Identifiable, Hashable {
    @CodingKeyIgnored() var id: UUID = .init()
    let name: String
    let surname: String
    let yearsOfExperience: Int
    @CodingKeyProperty("currentLocation") let location: String
    let company: String
    let about: String
}
