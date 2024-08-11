//
//  DeveloperCardRow.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 10.08.24.
//

import SwiftUI

// MARK: - Developer Card View
struct DeveloperCardRow: View {
    
    // MARK: Properties - UI Model
    private let uiModel: DeveloperCardRowUIModel
    
    // MARK: Properties - Data
    private let parameters: DeveloperCardRowParameters
    
    // MARK: initializers
    init(
        uiModel: DeveloperCardRowUIModel = .init(),
        parameters: DeveloperCardRowParameters
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
        ZStack(content: {
            RoundedRectangle(cornerRadius: uiModel.iconBackgroundCornerRadius)
                .frame(dimension: uiModel.iconBackgroundDimension)
                .foregroundStyle(uiModel.iconBackgroundColor)

            parameters.icon
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(dimension: uiModel.iconDimension)
                .foregroundColor(.blue)
        })
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
        DeveloperCardRow(parameters: DeveloperCardRowParameters.mock)
            .padding(15)
    }
}
#endif
