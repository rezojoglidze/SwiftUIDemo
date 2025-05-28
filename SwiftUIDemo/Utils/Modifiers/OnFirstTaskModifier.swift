//
//  OnFirstTaskModifier.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 28.05.25.
//

import SwiftUI

extension View {
    func onFirstTask(action: @escaping () async -> Void) -> some View {
        self
            .modifier(OnFirstTask(action: action))
    }
}

struct OnFirstTask: ViewModifier {
    @State private var hasRun = false
    let action: () async -> Void
    
    func body(content: Content) -> some View {
        content
            .task {
                if !hasRun {
                    hasRun = true
                    await action()
                }
            }
    }
}
