//
//  Extension+CGSize.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 11.08.24.
//

import CoreGraphics

// MARK: - CG Size Init with Dimension
extension CGSize {
    /// Initializes `CGSize` with dimension.
    ///
    ///     let size: CGSize = .init(dimension: 100)
    ///
    public init(dimension: CGFloat) {
        self.init(
            width: dimension,
            height: dimension
        )
    }
}
