//
//  GrowingAnimation.swift
//  Animations
//
//  Created by Rezo Joglidze on 11.09.24.
//

import Lottie
import SwiftUI

public struct GrowingAnimation: View {
    private let resourceName = "growing"
    
    public init() {}
    
    public var body: some View {
        
        LottieView(animation: .named(resourceName))
            .looping()
            .resizable()
            .ignoresSafeArea()
    }
       
}

#if DEBUG
#Preview {
    GrowingAnimation()
        .ignoresSafeArea()
}
#endif
