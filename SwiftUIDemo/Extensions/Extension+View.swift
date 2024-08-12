//
//  Extension+View.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 11.08.24.
//

import SwiftUI

// MARK: - Extension View
extension View {
    
    public func frame(
        dimension: CGFloat?,
        alignment: Alignment = .center
    ) -> some View {
        self
            .frame(
                width: dimension,
                height: dimension,
                alignment: alignment
            )
    }
    
    public func frame(
        size: CGSize?,
        alignment: Alignment = .center
    ) -> some View {
        self
            .frame(
                width: size?.width,
                height: size?.height,
                alignment: alignment
            )
    }
    
    public func onFirstAppear(
        perform action: (() -> Void)? = nil
    ) -> some View {
        self
            .modifier(OnFirstAppearModifier(action: action))
    }
}

// MARK: - On First Appear Modifier
private struct OnFirstAppearModifier: ViewModifier {
    // MARK: Properties
    private let action: (() -> Void)?
    
    @State private var didAppearForTheFirstTime: Bool = false
    
    // MARK: Initializers
    init(
        action: (() -> Void)?
    ) {
        self.action = action
    }
    
    // MARK: Body
    func body(content: Content) -> some View {
        content
            .onAppear(perform: {
                if !didAppearForTheFirstTime {
                    didAppearForTheFirstTime = true
                    action?()
                }
            })
    }
}
