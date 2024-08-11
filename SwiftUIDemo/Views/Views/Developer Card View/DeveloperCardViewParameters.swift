//
//  DeveloperCardViewParameters.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 10.08.24.
//

import SwiftUI
import RJSwiftMacros
import RJSwiftCommon

// MARK: Developer Card View Parameters
@MockBuilder()
struct DeveloperCardViewParameters {
    let icon: Image
    
    @MockBuilderProperty(value: "John Doe")
    let title: String
    
    @MockBuilderProperty(value: "iOS Developer with good expreince planing and building applications")
    let description: String
}

