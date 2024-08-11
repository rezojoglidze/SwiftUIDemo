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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            backgroundView
            developersView
                .padding(20)
        }).onAppear(perform: {
            viewModel.didLoad()
        })
    }
    
    private var backgroundView: some View {
        Color.gray
            .opacity(0.3)
            .ignoresSafeArea()
    }
    
    private var developersView: some View {
        ScrollView(content: {
            VStack(spacing: 10) {
                ForEach(
                    viewModel.developers,
                    id: \.about,
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
