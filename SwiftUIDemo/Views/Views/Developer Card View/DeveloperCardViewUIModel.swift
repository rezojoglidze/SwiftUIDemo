//
//  DeveloperCardViewUIModel.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 10.08.24.
//

import SwiftUI

// MARK: Developer Card View UI Model
struct DeveloperCardViewUIModel {
    let contentMargins: EdgeInsets = .init(top: 28, leading: 20, bottom: 28, trailing: 20)
    
    let backgroundColor: Color = .orange.opacity(0.3)
    var backgroundCornerRadius: CGFloat = 30

    let iconBackgroundSize: CGSize = .init(dimension: 60)
    let iconBackgroundColor: Color = .clear
    
    let iconSize: CGSize = .init(dimension: 40)
    
    let imageViewAndTextsSpacing: CGFloat = 20
    
    let titleAndDescriptionSpacing: CGFloat = 10

    let titleTextColor = Color.black
    let titleTextFont = FontBook.bold(size: 16)
    
    let descriptionTextColor = Color.black
    let descriptionTextFont = FontBook.regular(size: 16)
}
