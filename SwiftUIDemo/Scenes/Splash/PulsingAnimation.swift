//
//  File.swift
//  Animations
//
//  Created by Rezo Joglidze on 11.09.24.
//

import Lottie
import SwiftUI

public struct PulsingAnimation: View {
    private let resourceName = "pulsing"
    
    public init() {}
    
    public var body: some View {
        LottieView(animation: .named(resourceName))
            .looping()
    }
}

#if DEBUG
#Preview {
    PulsingAnimation()
}
#endif
