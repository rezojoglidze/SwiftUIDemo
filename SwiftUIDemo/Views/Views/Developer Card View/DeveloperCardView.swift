//
//  DeveloperCardView.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 10.08.24.
//

import SwiftUI

// MARK: - Developer Card View
struct DeveloperCardView: View {
    
    // MARK: Properties - UI Model
    private let uiModel: DeveloperCardViewUIModel
    
    // MARK: Properties - Data
    private let parameters: DeveloperCardViewParameters
    
    // MARK: initializers
    init(
        uiModel: DeveloperCardViewUIModel = .init(),
        parameters: DeveloperCardViewParameters
    ) {
        self.uiModel = uiModel
        self.parameters = parameters
    }
    
    // MARK: Body
    var body: some View {
        ZStack {
            contentView
                .background(content: { backgroundView })
        }
    }
    
    private var contentView: some View {
        HStack(spacing: 0) {
            imageView
            
            Spacer().frame(width: uiModel.imageViewAndTextsSpacing)
            
            VStack(alignment: .leading) {
                Text(parameters.title)
                    .foregroundStyle(uiModel.titleTextColor)
                    .font(uiModel.titleTextFont)
                
                Spacer().frame(height: uiModel.titleAndDescriptionSpacing)
                
                Text(parameters.description)
                    .foregroundStyle(uiModel.descriptionTextColor)
                    .font(uiModel.descriptionTextFont)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(uiModel.contentMargins)
    }
    
    private var imageView: some View {
        ZStack() {
            Circle()
                .fill(uiModel.iconBackgroundColor)
                .frame(size: uiModel.iconBackgroundSize)
            
            parameters.icon
                .resizable()
                .frame(size: uiModel.iconSize)
                .foregroundStyle(.indigo)
        }
        .clipShape(.circle)
    }
    
    private var backgroundView: some View {
        uiModel.backgroundColor
            .clipShape(.rect(cornerRadius: uiModel.backgroundCornerRadius ))
    }
}

// MARK: Preview
#if DEBUG
struct DeveloperCardView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperCardView(parameters: DeveloperCardViewParameters.mock)
            .padding(15)
    }
}
#endif
