//
//  FontBook.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 11.08.24.
//

import SwiftUI

// MARK: - Font Book
public struct FontBook {
    // MARK: Initializer
    private init() {}
    
    // MARK: Properties
    public static func regular(size: CGFloat) -> Font { .system(size: size, weight: .regular, design: .default) }
    public static func medium(size: CGFloat) -> Font { .system(size: size, weight: .medium, design: .default) }
    public static func bold(size: CGFloat) -> Font { .system(size: size, weight: .bold, design: .default) }
}
