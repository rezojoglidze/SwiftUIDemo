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
    
    // MARK: Properties - Navigation
    @State private var navigationPath = NavigationPath()
    
    // MARK: Initializers
    init() {
        self._viewModel = StateObject(wrappedValue: HomeViewModel())
    }
    
    // MARK: Body
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                backgroundView
                developersView
                    .padding(20)
            }
            .onFirstAppear(perform: {
                viewModel.didLoad()
            })
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home View")
            .navigationDestination(
                for: GetDevelopersEntity.self,
                destination: { entity in
                    DeveloperDetailsView(parameters: .init(developer: entity))
                }
            )
        }
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
                    id: \.id,
                    content: {
                        person in
                        DeveloperCardRow(
                            parameters: .init(
                                icon: Image(systemName: "swift"),
                                title: person.name,
                                description: person.surname,
                                tapAction: {
                                    navigationPath.append(person)
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
        configurePreview()
        
        return HomeView()
    }
}
#endif