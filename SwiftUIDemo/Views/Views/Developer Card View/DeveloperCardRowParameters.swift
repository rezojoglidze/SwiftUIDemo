//
//  DeveloperCardRowParameters.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 10.08.24.
//

import SwiftUI
import RJSwiftMacros
import RJSwiftCommon

// MARK: - Developer Card View Parameters
@MockBuilder()
struct DeveloperCardRowParameters {
    // MARK: Properties
    let icon: Image
    let title: String
    let description: String
    let tapAction: () -> Void
}
