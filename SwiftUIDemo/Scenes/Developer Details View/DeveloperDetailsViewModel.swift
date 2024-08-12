//
//  DeveloperDetailsViewModel.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 12.08.24.
//

import SwiftUI

// MARK: Developer Details ViewModel
class DeveloperDetailsViewModel: ObservableObject {
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
