//
//  DeveloperDetailsViewModel.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 12.08.24.
//

import SwiftUI
import Observation

// MARK: Developer Details ViewModel
@Observable
final class DeveloperDetailsViewModel {
    // MARK: Properties - Architecture
    let parameters: DeveloperDetailsViewParameters
    
    // MARK: Properties - Data
    var title: String {
        parameters.developer.name
    }
    
    var subTitle: String {
        parameters.developer.surname
    }
    
    var currentCity: String {
        parameters.developer.location
    }
    
    var description: String {
        parameters.developer.about
    }
    
    // MARK: Initializer
    init(parameters: DeveloperDetailsViewParameters) {
        self.parameters = parameters
    }
}
