//
//  PreviewConfiguration.swift
//  SwiftUIDemo
//
//  Created by Rezo Joglidze on 12.08.24.
//

#if DEBUG

import Foundation

// MARK: - Preview Configuration

private var isConfigured: Bool = false

func configurePreview() {
    guard !isConfigured else { return }
    isConfigured = true

    DIContainer.shared.injectPreviewDependencies()
}
#endif
