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
            developersView
                .padding(20)
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
            DeveloperCardRow(
                parameters: .init(
                    icon: Image(systemName: "swift"),
                    title: "das",
                    description: "DASda",
                    tapAction: {
                        
                    }
                )
            )
        }
        .padding()
    }
    
    private var developersView: some View {
        ScrollView(content: {
            VStack(spacing: 10) {
                ForEach(
                    viewModel.developers,
                    id: \.uuid,
                    content: { person in
                        DeveloperCardRow(
                            parameters: .init(
                                icon: Image(systemName: "swift"),
                                title: person.name,
                                description: person.surname, tapAction: {
                                    
                                }
                            )
                        )
                    }
                )
            }
        })
    }
}

// MARK: - Preview
#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
