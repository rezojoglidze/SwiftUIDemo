//
//  HomeView.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 10.08.24.
//

import SwiftUI

// MARK: - Home View
struct HomeView: View {
    // MARK: Properties
    @StateObject private var viewModel: HomeViewModel
    
    // MARK: Initializers
    init() {
        self._viewModel = StateObject(wrappedValue: HomeViewModel())
    }
    
    // MARK: Body
    var body: some View {
        ZStack(content: {
            backgroundView
            contentView
        })
    }
    
    private var backgroundView: some View {
        Color.gray
            .opacity(0.3)
            .ignoresSafeArea()
    }
    
    private var contentView: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
