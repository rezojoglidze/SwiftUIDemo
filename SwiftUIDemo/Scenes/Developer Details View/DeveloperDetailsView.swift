//
//  DeveloperDetailsView.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 12.08.24.
//

import SwiftUI

// MARK: Developer Details View
struct DeveloperDetailsView: View {
    // MARK: Properties
    @StateObject private var viewModel: DeveloperDetailsViewModel
    
    // MARK: Initializers
    init(parameters: DeveloperDetailsViewParameters) {
        self._viewModel = StateObject(wrappedValue: DeveloperDetailsViewModel(parameters: parameters))
    }
    
    // MARK: Body
    var body: some View {
        VStack {
            Spacer().frame(height: 50)
            contentView
            Spacer()
        }
        .padding(20)
    }
    
    private var contentView: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.orange.opacity(0.8))
            
            Spacer().frame(height: 30)
            
            HStack {
                informationView
                Spacer()
            }
        }
    }
    
    private var informationView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.title)
                .foregroundStyle(.black)
                .font(FontBook.bold(size: 24))
            
            Text(viewModel.subTitle)
                .foregroundStyle(.black)
                .font(FontBook.bold(size: 20))
            
            Text(viewModel.currentCity)
                .foregroundStyle(.gray)
                .font(FontBook.medium(size: 16))
            
            Text(viewModel.description)
                .foregroundStyle(.black)
                .font(FontBook.medium(size: 14))
        }
    }
}

// MARK: - Preview
#if DEBUG
struct DeveloperDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        configurePreview()
        
        return DeveloperDetailsView(parameters: .mock)
    }
}
#endif
